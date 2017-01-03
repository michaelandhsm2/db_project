class ItemsController < ApplicationController

  def index
    @store = Store.find(params[:id])
    @items = @store.items.paginate(page: params[:page], :per_page => 10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def catalog
    @items = Item.all
    @order_item = current_order.order_items.new
  end
  
end
