class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validate :order_repeat

  validates :order,     presence: true
  validates :item,      presence: true
  validates :quantity,  presence: true, numericality: { only_integer: true, greater_than: 0 }

end

private

def order_repeat
  if order.items.include? item
    errors.add(:item, "can not be in the same order twice.")
  end

end
