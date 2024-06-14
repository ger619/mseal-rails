# == Schema Information
#
# Table name: tables
#
#  id               :uuid             not null, primary key
#  d                :integer
#  ga               :integer
#  gf               :integer
#  l                :integer
#  w                :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  opponent_team_id :uuid             not null
#  season_id        :uuid             not null
#  user_id          :uuid             not null
#
# Indexes
#
#  index_tables_on_opponent_team_id  (opponent_team_id)
#  index_tables_on_season_id         (season_id)
#  index_tables_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (opponent_team_id => opponent_teams.id)
#  fk_rails_...  (season_id => seasons.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class TableTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
