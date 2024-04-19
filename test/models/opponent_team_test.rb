# == Schema Information
#
# Table name: opponent_teams
#
#  id         :uuid             not null, primary key
#  name       :string
#  team_url   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid
#
# Indexes
#
#  index_opponent_teams_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class OpponentTeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
