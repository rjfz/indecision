# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  before_action :authorize

  rescue_from ValidationError, with: :rescue_validation

  ACTION_PERMISSION_MAP = {
    index: :view,
    dashboard: :view,
    stats: :view,
    room_information: :view,
    leaderboard: :view,
    cohort: :view,
    individual: :view,
    show: :view,
    new: :create,
    create: :create,
    edit: :update,
    update: :update,
    destroy: :delete,
    finish: :update
}.freeze

  layout 'private'

  def signed_in?
    current_user != nil
  end

  def require_signed_in
    redirect_to '/' unless signed_in?
  end

  def symbolize(parameters)
    parameters.to_h.symbolize_keys
  end


  private

  def rescue_validation(error)
    send_notification(text: error.message, style: :error)
  end

  def send_notification(text:, style:)
    render turbo_stream: append_notification(text: text, style: style)
  end

  def append_notification(text:, style:)
    turbo_stream.append(
      'notifications',
      partial: 'application/notification',
      locals: { text: text, style: style }
    )
  end

  def can_access?
    resource = self.class.name.gsub('Controller', '').downcase.singularize.to_sym

    puts resource
    puts action_name
    puts ACTION_PERMISSION_MAP[action_name.to_sym]
    pp current_user

    can? ACTION_PERMISSION_MAP[action_name.to_sym], resource

  end

  def authorize
    return if can_access?

    flash[:error] = 'ayo you do not have access'
    redirect_back(fallback_location: homepage_path)
  end


end
