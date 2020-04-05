class Shop < ApplicationRecord
  validates :user_id, presence: true
  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :name, presence: true

  belongs_to :user
  has_one :genre
  accepts_nested_attributes_for :genre
  mount_uploader :image, ImageUploader
end
