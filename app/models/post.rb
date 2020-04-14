class Post < ApplicationRecord
  validates :title, presence: true,length:{maximum:15}
  validates :taste, presence: true,length:{maximum:100}
  validates :atmosphere, presence: true,length:{maximum:100}
  validates :service, presence: true,length:{maximum:100}
  belongs_to :shop
  belongs_to :user
end
