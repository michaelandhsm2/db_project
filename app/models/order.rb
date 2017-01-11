class Order < ApplicationRecord
  belongs_to :user, inverse_of: :orders
  has_many :order_items
  has_many :items, through: :order_items

  before_save :update_total_price, :update_fee

  validates :status, inclusion: { in: [nil, "received", "processing", "shipping", "complete"] }

  def total_price
    order_items.collect { |tuple| tuple.valid? ? (tuple.quantity * price_counter(tuple.item)) : 0 }.sum
  end

  def shipping_fee
    shipping_fees(order_items.collect { |tuple| tuple.quantity }.sum)
  end

  private
    def update_total_price
      self.total_price = total_price
    end

    def shipping_fees quantity
      25 * (quantity ** 0.5)
    end

    def update_fee
      cost = shipping_fee
      if cost.nil?
        cost = 0
      else
        col = Shipping.all.collect{|e| [e.minimum_spending, e.discount]}
        col.sort!{|a,b| a[0] <=> b[0] }
        col.each do |min, dis|
          if(total_price > min)
            cost = (cost * (100-dis))/100
            break
          end
        end
      end
      self.fee = cost
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
end
