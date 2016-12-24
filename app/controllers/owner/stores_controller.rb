class Owner::StoresController < ApplicationController
  before_action :set_store, only: [:edit, :update, :destroy]

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      flash[:success] = "商店成功建立了！"
      redirect_to @store
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @store.update_attributes(store_params)
      flash[:success] = "商店成功更新了！"
      redirect_to @store
    else
      render 'edit'
    end
  end

  def destroy
    @store.destroy
    flash[:success] = "User deleted"
    redirect_to 'index'
  end

end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_store
    @store = Store.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def store_params
    params.require(:store).permit(:name, :address, :email, :phone, :description, :image)
  end
