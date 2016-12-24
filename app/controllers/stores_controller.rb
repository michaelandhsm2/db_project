class StoresController < ApplicationController
  before_action :set_store, only: [:show]

  def index
    @stores = Store.paginate(page: params[:page], :per_page => 10)
  end

  def show
  end

end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_store
    @store = Store.find(params[:id])
  end
