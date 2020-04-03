class Shop < ApplicationRecord
  validates :user_id, presence: true
  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :store_name, presence: true

  belongs_to :user
  mount_uploader :image, ImageUploader
end
