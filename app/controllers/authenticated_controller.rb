# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  before_action :authorize

  ACTION_PERMISSION_MAP = {
    index: :view,
    dashboard: :view,
    stats: :view,
    room_information: :view,
    leaderboard: :view,
    show: :view,
    new: :create,
    create: :create,
    edit: :update,
    update: :update,
    destroy: :delete
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
