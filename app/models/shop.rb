class Shop < ApplicationRecord
  validates :user_id, presence: true
  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :name, presence: true

  belongs_to :user
  belongs_to :genre
  belongs_to :pricerange
  has_many :posts
  belongs_to :address
  mount_uploader :image, ImageUploader
end
