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

  def self.search(name,genre_id,pricerange_id,address_id)
    if name || genre_id || pricerange_id ||address_id
      Shop.where(["name LIKE ? OR genre_id = ? OR pricerange_id = ? OR address_id = ?", "%#{name}%","#{genre_id}","#{pricerange_id}","#{address_id}"])
    else
      Shop.all.order(id: "asc") 
    end
  end
end


