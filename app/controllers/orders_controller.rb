class OrdersController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user

  def index
    @orders = current_user.orders.paginate(page: params[:page], :per_page => 10)
  end

  def show
    @order = current_user.orders.find(params[:id])
    @order_items = @order.order_items
  end

  private

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "請先登入會員"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
