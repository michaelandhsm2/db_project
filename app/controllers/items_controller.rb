class ItemsController < ApplicationController
  before_action :set_store, only: [:index]

  def index
    @items = @store.items.paginate(page: params[:page], :per_page => 10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def catalog
    @items = Item.paginate(page: params[:page], :per_page => 10)
  end

end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_store
    @store = Store.find(params[:id])
  end
