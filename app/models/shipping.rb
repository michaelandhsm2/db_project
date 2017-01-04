class Shipping < ApplicationRecord
  has_one  :event, dependent: :destroy, as: :event_code
  accepts_nested_attributes_for :event

  validates :minimum_spending, uniqueness: true, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :discount, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

end
