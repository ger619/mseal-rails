class Product < ApplicationRecord
  has_one_attached :photo_product
  has_many :orderables
  has_many :carts, through: :orderables
end
