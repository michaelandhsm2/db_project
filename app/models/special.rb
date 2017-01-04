class Special < ApplicationRecord
  has_one  :event, dependent: :destroy, as: :event_code
  accepts_nested_attributes_for :event
  has_and_belongs_to_many :items
end
