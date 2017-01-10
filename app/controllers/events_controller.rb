class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
    params[:type] = @event.event_code_type.downcase
    find_event(params[:type], @event.event_code_id)
  end

end

private

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
