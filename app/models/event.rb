class Event < ApplicationRecord
  belongs_to  :event_code, polymorphic: true


  validates :name, uniqueness: true, presence: true
end
