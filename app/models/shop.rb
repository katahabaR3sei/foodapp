class Shop < ApplicationRecord
  validates :user_id, presence: true
  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :name, presence: true

  belongs_to :user
  belongs_to :genre
  has_many :posts
  mount_uploader :image, ImageUploader
end
