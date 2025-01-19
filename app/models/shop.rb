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
class Shop < ApplicationRecord
end
