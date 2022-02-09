# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    def after_sign_in_path_for(_resource)
      if resource.role.name == 'student'
        homepage_url
      else
        dashboard_url
      end
    end

    def after_sign_out_path_for(_resource)
      homepage_url
    end

    # protected

    # def update_resource(resource, params)
    #   resource.update_without_password(params)
    # end
  end
end
