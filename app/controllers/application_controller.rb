# frozen_string_literal: true

class ApplicationController < ActionController::Base

  before_action :anon_user

  def signed_in?
    current_user != nil
  end

  def require_signed_in
    redirect_to '/' unless signed_in?
  end

  def symbolize(parameters)
    parameters.to_h.symbolize_keys
  end

  def anon_user
    return @anon_user if @anon_user

    current_id = cookies[:user_identifier]
    @anon_user = if current_id
                   AnonUser.find(current_id)
                 else
                   Operations::AnonUser::Create::EntryPoint.call
                 end
    cookies[:user_identifier] = @anon_user.id
    @anon_user
  end
end
