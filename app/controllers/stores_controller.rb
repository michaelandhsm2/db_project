class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to @store
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
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
