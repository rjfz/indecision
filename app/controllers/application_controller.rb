# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :anon_user

  before_action :configure_permitted_parameters, if: :devise_controller?

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

    return @anon_user = current_user.anon_user if current_user&.anon_user

    current_id = cookies[:user_identifier]
    @anon_user = if current_id
                   AnonUser.find(current_id)
                 else
                   Operations::AnonUser::Create::EntryPoint.call
                 end

    Operations::AnonUser::Update::EntryPoint.call(anon_user: @anon_user, user_id: current_user.id) if current_user

    cookies[:user_identifier] = @anon_user.id
    @anon_user
  end

  protected

       def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:role_id, :email, :password)}

            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password)}
       end
end
