class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /(?=.*[A-za-z])(?=.*\d).{6,20}/
  VALID_NATIONAL_ID_REGEX = /[A-za-z][0-9]{9}/i
  VALID_PHONE_REGEX = /0[0-9]{9}/
  VALID_CELLPHONE_REGEX = /09[0-9]{8}/

  has_many :orders, inverse_of: :user
  has_and_belongs_to_many :stores, inverse_of: :users
  has_many :owned_stores, class_name: "Store", inverse_of: :owner

  before_save { self.email = email.downcase }
  before_validation { self.is_admin = false }
  before_validation { self.is_owner = false }

  validates :email,          presence: true, length: { maximum: 255 },
                             format: { with: VALID_EMAIL_REGEX },
                             uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password,       presence: true, format: { with: VALID_PASSWORD_REGEX }, allow_blank: true

  validates :name,           presence: true, length: { minimum: 2, maximum: 50 }

  validates :national_id,    presence: true, format: { with: VALID_NATIONAL_ID_REGEX },
                             uniqueness: { case_sensitive: false }

  validates :birthdate,      presence: true

  validates :phone,          allow_blank: true, format: { with: VALID_PHONE_REGEX }

  validates :cellphone,      presence: true, format: { with: VALID_CELLPHONE_REGEX }

  validates :address,        presence: true, length: { maximum: 255 }

  validates :gender,         allow_blank: true, inclusion: { in: ["male", "female"] }

  validates :is_admin,       inclusion: { in: [true, false] }

  validates :is_owner,       inclusion: { in: [true, false] }
end
