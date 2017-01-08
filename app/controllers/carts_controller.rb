class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
  end

  def confirm
    @order_items = current_order.order_items
  end

  def submit
    @order = current_order
    @order.status = "received"
    @order.save
    session.delete(:order_id)
    flash[:success] = "訂單成功送出"
    redirect_to root_url
  end
end
