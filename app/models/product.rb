# == Schema Information
#
# Table name: products
#
#  id            :uuid             not null, primary key
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
  belongs_to :user
  has_one_attached :photo_product
  has_many :orderables, foreign_key: :product_id, class_name: 'Orderable', dependent: :destroy
  has_many :carts, through: :orderables, dependent: :destroy
  has_rich_text :content
end
