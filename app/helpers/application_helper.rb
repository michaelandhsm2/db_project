module ApplicationHelper
 def flash_message type, text

   flash[type] ||= []
   flash[type] << text
 end


  def flash_message_now type, text

    flash.now[type] ||= []
    flash.now[type] << text
  end

  def price_counter item
    if item.is_a?(Item)
      price = item.price
      item.store.events.each do |e|
        if e.start_date < DateTime.current && e.end_date > DateTime.current
          price = ((100-e.discount)*price)/100
        end
      end
      item.specials.each do |e|
        if e.start_date < DateTime.current && e.end_date > DateTime.current
          price *= ((100-e.discount)*price)/100
        end
      end
      return price
    else
      return nil
    end
  end

    def is_store_user?
      if (current_user.is_admin || (current_user.stores.include? @store) || current_user == @store.owner)
        return true
      else
        return false
      end
    end

end
