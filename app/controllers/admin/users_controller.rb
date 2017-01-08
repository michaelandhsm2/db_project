class Admin::UsersController < ApplicationController
  before_action :is_admin?

  def index
    @users = User.paginate(page: params[:page], :per_page => 10)
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
  end

  private

    def is_admin?
      unless current_user.is_admin
        flash[:danger] = "你的身分並非管理者"
        redirect_to root_url
      end
    end

    def user_params
      params.require(:user).permit(:is_admin)
    end
end
