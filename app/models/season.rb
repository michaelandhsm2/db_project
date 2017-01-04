class Season < ApplicationRecord
  has_one  :event, dependent: :destroy, as: :event_code
  accepts_nested_attributes_for :event

  validate :end_is_later_than_start, :end_date_after_today, :start_date_after_today

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :discount, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end


def end_is_later_than_start
    if start_date >= end_date
      errors.add(:start_date,"can't be after discount ending date.")
    end
end

def start_date_after_today
    if start_date < DateTime.current
      errors.add(:start_date_date,"has to be in the future.")
    end
end

def end_date_after_today
    if end_date  < DateTime.current
      errors.add(:end_date,"has to be in the future.")
    end
end
