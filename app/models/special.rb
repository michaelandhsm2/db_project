class Special < ApplicationRecord
  belongs_to  :events, as: event_code
  has_and_belongs_to_many :items
end
