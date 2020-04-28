class Shop < ApplicationRecord
  validates :user_id, presence: true
  validates :image, presence: true
  validates :title, presence: true,length:{maximum:15}
  validates :description, presence: true
  validates :name, presence: true

  belongs_to :user
  belongs_to :genre
  belongs_to :pricerange
  has_many :posts
  belongs_to :address
  mount_uploader :image, ImageUploader

  def self.search(shop_params)
    if shop_params
      Shop.where(["name LIKE ? OR genre_id = ? OR pricerange_id = ? OR address_id = ?", "%#{shop_params[0]}%",shop_params[1],shop_params[2],shop_params[3]])
    else
      Shop.all.order(id: "asc") 
    end
  end
end


