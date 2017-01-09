class Owner::StoresController < ApplicationController
  before_filter :set_store, only: [:edit, :update, :destroy]
  before_action :check_owner
  before_filter :check_store_owner, only: [:edit, :update, :destroy]

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    @store.owner = current_user
    if @store.save
      flash[:success] = "商店成功建立了！"
      if(!@store.image.nil?)
        @store.remote_image_url = "https://place-hold.it/300x240/aaa.png"
        @store.save!
      end
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
    index = @store.id
    if @store.destroy
      flash[:success] = "User deleted"
    end
    redirect_back fallback_location: stores_path
  end

end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_store
    @store = Store.find(params[:id])
  end

  def check_owner
    unless current_user.is_owner
      flash[:danger] = "你的身分並非商店管理者"
      redirect_back fallback_location: root_path
    end
  end

  def check_store_owner
    unless is_store_user?
      flash[:danger] = "你非此商店之管理者"
      redirect_back fallback_location: root_path
    end
  end

  def is_store_user?
    if (current_user.is_admin || (current_user.stores.include? @store) || current_user == @store.owner)
      return true
    else
      return false
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def store_params
    params.require(:store).permit!
  end
