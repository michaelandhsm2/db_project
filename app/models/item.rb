class Item < ApplicationRecord
  belongs_to :store, inverse_of: :items
  has_and_belongs_to_many :specials, inverse_of: :items

  mount_uploader :image, ImageUploader

=begin
  validates :name         presence: true, uniqueness: true

  validates :quantity      presence: true, numericality: { greater_than_or_equal_to: 0 }

  validates :price         presence: true, numericality: { greater_than: 0 }

  validates :store         presence: true
=end
  validates_processing_of :image

  validate :image_size_validation

  validates_associated :store
end

private

  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end
