module Users
  class SessionsController < Devise::SessionsController
    def after_sign_in_path_for(resource)
      dashboard_url
    end
    def after_sign_out_path_for(resource)
      homepage_url
    end

    # protected

    # def update_resource(resource, params)
    #   resource.update_without_password(params)
    # end
  end
end
