class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(user_params)
    if @event.save
      log_in @event
      flash[:success] = "註冊成功！"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(user_params)
      flash[:success] = "會員資料已變更"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
  end

  def index
  end


end
