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
    shops = Shop.all
    shops = shops.where("name LIKE ?", "%#{shop_params[0]}%") if shop_params[0].present?
    shops = shops.where(genre_id: shop_params[1]) if shop_params[1].present?
    shops = shops.where(pricerange_id: shop_params[2]) if shop_params[2].present?
    shops = shops.where(address_id: shop_params[3]) if shop_params[3].present?
    shops.order(id: "asc")
  end
end


