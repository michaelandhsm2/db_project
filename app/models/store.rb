class Store < ApplicationRecord
  mount_uploader :image, ImageUploader
end
