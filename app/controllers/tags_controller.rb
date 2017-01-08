class TagsController < ApplicationController
  def show
    @item = Item.tagged_with(params[:label]).paginate(page: params[:page], :per_page => 8)
  end

  def index
    @tags = ActsAsTaggableOn::Tag.all
  end
end
