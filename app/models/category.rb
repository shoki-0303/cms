class Category < ApplicationRecord
  include FriendlyId
  friendly_id :slug_name
  has_many :articles
  mount_uploader :image, ImageUploader
end
