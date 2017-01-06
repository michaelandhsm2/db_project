class Season < ApplicationRecord
  has_one  :event, dependent: :destroy, as: :event_code
  belongs_to  :store, inverse_of: :events
  accepts_nested_attributes_for :event

  validate :end_is_later_than_start, :end_date_after_today, :no_duplicate_per_store

  validates :store_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :discount, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end


def end_is_later_than_start
    if !start_date.nil? && !end_date.nil? && start_date >= end_date
      errors.add(:start_date,"can't be after discount ending date.")
    end
end

def no_duplicate_per_store
  Store.find(store_id).events.each do |e|
    if !start_date.nil? && start_date > e.start_date && start_date < e.end_date
      errors.add(:start_date,"cannot collide with #{e.event.name}. (#{e.start_date.to_formatted_s(:long)} ~ #{e.end_date.to_formatted_s(:long)}")
    end
    if !end_date.nil? && end_date > e.start_date && end_date < e.end_date
      errors.add(:end_date,"cannot collide with #{e.event.name}. (#{e.start_date.to_formatted_s(:long)} ~ #{e.end_date.to_formatted_s(:long)}")
    end
  end
end

def end_date_after_today
    if !end_date.nil? && end_date  < DateTime.current
      errors.add(:end_date,"has to be in the future.")
    end
end
