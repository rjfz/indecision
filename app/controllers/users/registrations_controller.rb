# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_account_update_params, only: [:update]
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
    end

    def after_sign_up_path_for(_resource)
      dashboard_url
    end

    # protected

    # def update_resource(resource, params)
    #   resource.update_without_password(params)
    # end
  end
end
