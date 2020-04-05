class Genre < ApplicationRecord
  validates :name, presence: true
  belongs_to :shop,optional: true
end
