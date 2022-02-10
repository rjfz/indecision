class UsersController < ApplicationController
  include UserDependencies['update_user']


  before_action :user, only: %i[edit]
    def index
      @user = Presenter.from(User.all) if User.any?
    end

    def update
      @user = update_user.call(user: user, **user_params)
      redirect_to dashboard_path
    end

    def show
    end

    private

    def user
      @user ||= User.find(params[:id])
    end

    def user_params
      symbolize params.require(:user).permit(
        :role_id,
        :email,
        :id
      )
    end
  end
