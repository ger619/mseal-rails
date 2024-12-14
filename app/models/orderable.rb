# == Schema Information
#
# Table name: orderables
#
#  id         :uuid             not null, primary key
#  quantity   :integer
#  size       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :uuid             not null
#  product_id :uuid             not null
#
# Indexes
#
#  index_orderables_on_cart_id     (cart_id)
#  index_orderables_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (product_id => products.id)
#
class Orderable < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total
    product.price * quantity
  end
end
