class Event < ApplicationRecord
  has_one   :event_code, polymorphic: true
end
