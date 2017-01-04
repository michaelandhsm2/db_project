class Special < ApplicationRecord
  has_one  :event, dependent: :destroy, as: :event_code
  has_and_belongs_to_many :items
end
