# == Schema Information
#
# Table name: products
#
#  id            :uuid             not null, primary key
#  description   :string
#  name          :text
#  photo_product :string
#  price         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :uuid             not null
#
# Indexes
#
#  index_products_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Product < ApplicationRecord
  has_one_attached :photo_product
  has_many :orderables
  has_many :carts, through: :orderables
end
