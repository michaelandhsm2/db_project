class OrderItemsController < ApplicationController
  before_action :logged_in_user

  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.user_id = current_user.id
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private

    def order_item_params
      params.require(:order_item).permit(:quantity, :item_id)
    end

      def logged_in_user
        unless logged_in?
          store_location
          flash[:danger] = "請先登入會員"
          redirect_to login_url
        end
      end
end
