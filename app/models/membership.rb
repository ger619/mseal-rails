# == Schema Information
#
# Table name: memberships
#
#  id                 :uuid             not null, primary key
#  country            :string
#  date_of_birth      :date
#  email              :string
#  name               :string
#  phone_number       :integer
#  title              :string
#  type_of_membership :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Membership < ApplicationRecord
  validates :type_of_membership, :title, :name, :country, :date_of_birth, :email, :phone_number, presence: true
end
