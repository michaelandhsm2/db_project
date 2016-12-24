class StoresController < ApplicationController
  before_action :set_store, only: [:show]

  def index
  end

  def show
  end

end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_store
    @store = Store.find(params[:id])
  end
