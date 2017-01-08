class Owner::ItemsController < ApplicationController
  before_filter :set_item, only: [:edit, :update, :destroy]
  before_filter :set_store, only: [:new, :create, :edit, :update]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.store = @store
    if @item.save
      flash[:success] = "商品成功建立了！"
      if(!@item.image.nil?)
        @item.image = Rails.root.join("app/assets/images/rnd/food/"+r.rand(1..40).to_s+".jpg").open
        @item.save!
      end
      redirect_to owner_item_path(@item)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @item.update_attributes(item_params)
      flash[:success] = "商店成功更新了！"
      redirect_to owner_item_path(@item)
    else
      render 'edit'
    end
  end

  def destroy
    index = @item.id
    if @item.destroy
      flash[:success] = "User deleted"
    end
    redirect_back fallback_location:"/items"
  end

end

private
  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:name, :price, :quantity, :description, :image, :tag_list)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_store
    if !params[:store_id].nil?
      @store = Store.find(params[:store_id])
    elsif !params[:id].nil?
      @store = Store.find(params[:id])
    else
      @store = @item.store
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    if !params[:item_id].nil?
      @item = Item.find(params[:item_id])
    else
      @item = Item.find(params[:id])
    end
  end
