class Owner::OrdersController < ApplicationController
  before_action :owner?

  def index
    @orders = owned_orders.paginate(page: params[:page], :per_page => 10)
    store_current_location
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order.update_attributes(order_params)
  end


  private

    def owned_orders
      list = []
      Order.all.each do |order|
        stores = order.order_items.collect{|x| Item.find(x.item_id).store}.uniq
        if (current_user.stores - stores).count  != current_user.stores.count
          list << order
        end
      end
      return list
    end

    def order_params
      params.require(:order).permit(:status)
    end

    def owner?
      unless current_user.is_admin || current_user.is_owner
        flash[:danger] =  "你的身分並非管理者"
        redirect_back_or root_url
      end
    end

end
