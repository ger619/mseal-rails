# == Schema Information
#
# Table name: carts
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  has_many :orderables
  has_many :products, through: :orderables
  def total_price
    orderables.to_a.sum(&:total)
  end
end
