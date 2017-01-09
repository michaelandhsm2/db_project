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
    session.delete(:order_id)
    flash[:success] = "訂單成功送出"
    redirect_to root_url
  end

  private

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "請先登入會員"
        redirect_to login_url
      end
    end
end
