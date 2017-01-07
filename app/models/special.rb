class Special < ApplicationRecord
  has_one  :event, dependent: :destroy, as: :event_code
  accepts_nested_attributes_for :event
  has_and_belongs_to_many :items, inverse_of: :specials

    validate :end_is_later_than_start, :end_date_after_today

    validates :item_ids, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :discount, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end

private
  def end_is_later_than_start
      if !start_date.nil? && !end_date.nil? && start_date >= end_date
        errors.add(:start_date,"can't be after discount ending date.")
      end
  end

  def end_date_after_today
      if !end_date.nil? && end_date  < DateTime.current
        errors.add(:end_date,"has to be in the future.")
      end
  end
