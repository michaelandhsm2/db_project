class Admin::OrdersController < ApplicationController
  before_action :is_admin?

  def index
    @orders = Order.paginate(page: params[:page], :per_page => 10)
    store_current_location
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  private

    def is_admin?
      unless current_user.is_admin
        flash[:danger] =  "你的身分並非管理者"
        redirect_back_or root_url
      end
    end
end
