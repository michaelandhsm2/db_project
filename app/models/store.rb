class Store < ApplicationRecord

  has_many :items, dependent: :destroy, inverse_of: :store
  has_many :events, dependent: :destroy, class_name: "Season", inverse_of: :store
  has_and_belongs_to_many :users, inverse_of: :stores
  belongs_to :owner, class_name: "User", dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /0[0-9]{9}/

  mount_uploader :image, ImageUploader
  before_save { self.email = email.downcase }


  validates :name,         presence:true, uniqueness:{case_sensitive:false,
                           message: "%{value} is already taken as a store name."},
                           length: { minimum: 2, maximum: 50 }

  validates :address,      presence: true, length: { maximum: 255 }

  validates :email,        presence: true, length: { maximum: 255 },
                           format: { with: VALID_EMAIL_REGEX },
                           uniqueness: { case_sensitive: false }

  validates :phone,        allow_blank: true, format: { with: VALID_PHONE_REGEX }

  validates_processing_of :image

  validate :image_size_validation


end

private

  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end
