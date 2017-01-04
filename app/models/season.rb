class Season < ApplicationRecord
  has_one  :event, dependent: :destroy, as: :event_code
end
