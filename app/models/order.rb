class Order < ApplicationRecord
  belongs_to :user, inverse_of: :orders
  has_many :order_items

  before_save :update_total_price

  validates :status, inclusion: { in: [nil, "received", "processing", "shipping", "complete"] }

  def total_price
    order_items.collect { |tuple| tuple.valid? ? (tuple.quantity * price_counter(tuple.item)) : 0 }.sum
  end

  private
    def update_total_price
      self.total_price = total_price
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
