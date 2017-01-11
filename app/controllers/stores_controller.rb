class StoresController < ApplicationController

  def index
    @stores = Store.paginate(page: params[:page], :per_page => 8)
  end

  def show
    @store = Store.find(params[:id])
    @items = @store.items.paginate(page: params[:page], :per_page => 5)
    @store.events.each do |e|
      if e.start_date < DateTime.current && e.end_date > DateTime.current
        flash_message_now :info, "#{e.event.name} - Everything in #{e.store.name} is #{e.discount}% off between #{e.start_date.strftime("%b %e, %C%y")} and #{e.end_date.strftime("%b %e, %C%y")}."
      end
    end
  end

end

private
