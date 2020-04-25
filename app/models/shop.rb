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

  def self.search(search: nil, genre_id: nil, pricerange_id: nil, address_id: nil)
    result = Shop.all.order(id: "asc") 

    if search
      result = Shop.where(["name LIKE ?", "%#{search}%"])
    end

    if genre_id
      result = Genre.find(genre_id).shops
    end

    if pricerange_id
      result = Pricerange.find(pricerange_id).shops
    end

    if address_id
      result = Address.find(address_id).shops
    end

    result

  end
end
