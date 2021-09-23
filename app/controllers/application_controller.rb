class ApplicationController < ActionController::Base

    def signed_in?
        current_user != nil
    end
    def require_signed_in
        redirect_to '/' unless signed_in?
    end
end