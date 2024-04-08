# == Schema Information
#
# Table name: shops
#
#  id           :uuid             not null, primary key
#  description  :string
#  photo        :string
#  price        :string
#  product_name :string
#  quantity     :string
#  size         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
