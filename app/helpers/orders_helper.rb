module OrdersHelper
  def order_status(order)
    case order.status
    when nil
      "訂單尚未送出"
    when "received"
      "訂單已送出"
    when "processing"
      "出貨準備中"
    when "shipping"
      "運送中"
    when "complete"
      "完成"
    end
  end
end
