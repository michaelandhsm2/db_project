class Season < ApplicationRecord
  has_one  :event, as: :event_code
end
