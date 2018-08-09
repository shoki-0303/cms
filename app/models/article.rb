class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :article_tags
  has_many :tags, through: :article_tags
  mount_uploader :image, ImageUploader
end
