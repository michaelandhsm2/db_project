class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.paginate(page: params[:page], :per_page => 10)
  end

  def show
    @order = current_user.orders.find(params[:id])
    @order_items = @order.order_items
  end
end
