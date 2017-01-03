class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :order,     presence: true
  validates :item,      presence: true
  validates :quantity,  presence: true, numericality: { only_integer: true, greater_than: 0 }
end
