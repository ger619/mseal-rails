# == Schema Information
#
# Table name: adverts
#
#  id             :uuid             not null, primary key
#  header_advert  :string
#  type_of_advert :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :uuid             not null
#
# Indexes
#
#  index_adverts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class AdvertTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
