class Order < ApplicationRecord
  belongs_to :user, inverse_of: :orders
  has_many :order_items

  before_save :update_total_price

  validates :status, inclusion: { in: [nil, "received", "processing", "shipping", "complete"] }

  def total_price
    order_items.collect { |tuple| tuple.valid? ? (tuple.quantity * tuple.item.price) : 0 }.sum
  end

  private
    def update_total_price
      self.total_price = total_price
    end
end
