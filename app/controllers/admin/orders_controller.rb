class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.paginate(page: params[:page], :per_page => 10)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end
end
