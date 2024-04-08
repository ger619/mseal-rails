# == Schema Information
#
# Table name: memberships
#
#  id                 :uuid             not null, primary key
#  country            :string
#  date_of_birth      :date
#  email              :string
#  phone_number       :integer
#  title              :string
#  type_of_membership :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
