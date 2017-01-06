module ApplicationHelper
 def flash_message type, text

   flash[type] ||= []
   flash[type] << text
 end


  def flash_message_now type, text

    flash.now[type] ||= []
    flash.now[type] << text
  end

end
