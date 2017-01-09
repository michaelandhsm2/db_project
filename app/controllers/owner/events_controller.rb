class Owner::EventsController < ApplicationController


  def new
    new_event(params[:type])
    @event_code.build_event
  end

  def create
    create_event(params[:type])
    if @event_code.save
      flash[:success] = "活動建立成功！"
      redirect_to event_path(@event_code.event.id)
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
    params[:type] = @event.event_code_type.downcase!
    find_event(params[:type], @event.event_code_id)
  end

  def update
    @event = Event.find(params[:id])
    find_event(params[:type], @event.event_code_id)
    if update_event(params[:type])
      flash[:success] = "活動資料已變更"
      redirect_to event_path(params[:id])
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    params[:type] = @event.event_code_type.downcase!
    find_event(params[:type], @event.event_code_id)
    if @event_code.destroy
      flash[:success] = "Event deleted"
    end
    redirect_back fallback_location: events_path
  end

  def index
    @events = Event.paginate(page: params[:page], :per_page => 10)
  end


end

private

  def new_event(event_code)
    if event_code == "shipping"
      @event_code = Shipping.new
    elsif event_code == "season"
      @event_code = Season.new
    elsif event_code == "special"
      @event_code = Special.new
    else
      @event_code = Coupon.new
    end
  end

  def create_event(event_code)
    if event_code == "shipping"
      @event_code = Shipping.new(params.require(:shipping).permit!)
    elsif event_code == "season"
      @event_code = Season.new(params.require(:season).permit!)
    elsif event_code == "special"
      @event_code = Special.new(params.require(:special).permit!)
    else
      @event_code = Coupon.new(params.require(:coupon).permit!)
    end
  end

  def update_event(event_code)
    if event_code == "shipping"
      @event_code.update_attributes(params.require(:shipping).permit!)
    elsif event_code == "season"
      @event_code.update_attributes(params.require(:season).permit!)
    elsif event_code == "special"
      @event_code.update_attributes(params.require(:special).permit!)
    else
      @event_code.update_attributes(params.require(:coupon).permit!)
    end
  end

  def find_event(event_code, id)
    if event_code == "shipping"
      @event_code = Shipping.find(id)
    elsif event_code == "season"
      @event_code = Season.find(id)
    elsif event_code == "special"
      @event_code = Special.find(id)
    else
      @event_code = Coupon.find(id)
    end
  end
