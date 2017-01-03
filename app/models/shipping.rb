class Shipping < ApplicationRecord
  belongs_to  :events, as: event_code
end
