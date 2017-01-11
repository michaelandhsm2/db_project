class CartsController < ApplicationController
  before_action :logged_in_user

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
    order_from_items
    session.delete(:order_id)
    flash[:success] = "訂單成功送出"
    redirect_to root_url
  end

  private
    def order_from_items
      @order.order_items.each do |order_item|
        item = Item.find(order_item.item_id)
        item.quantity -= order_item.quantity
        item.save!
      end
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "請先登入會員"
        redirect_to login_url
      end
    end
end
