class Category < ApplicationRecord
  include FriendlyId
  friendly_id :name
  has_many :articles
  mount_uploader :image, ImageUploader
end
