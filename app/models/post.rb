class Post < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :shop
  belongs_to :user
end
