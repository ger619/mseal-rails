# == Schema Information
#
# Table name: carts
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  has_many :orderables, dependent: :destroy
  has_many :products, through: :orderables, dependent: :destroy
  def total_price
    orderables.to_a.sum(&:total)
  end

  # Quantity of products in the cart < Than the number of products in the cart
end
