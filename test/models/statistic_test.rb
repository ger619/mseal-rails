# == Schema Information
#
# Table name: statistics
#
#  id                     :uuid             not null, primary key
#  assists                :integer          default(0)
#  duel_attempted         :integer          default(0)
#  duel_won               :integer          default(0)
#  fouls_committed        :integer          default(0)
#  fouls_won              :integer          default(0)
#  goals_scored           :integer          default(0)
#  interception_attempted :integer          default(0)
#  interception_won       :integer          default(0)
#  matches_played         :integer          default(0)
#  matches_started        :integer          default(0)
#  minutes_played         :integer          default(0)
#  passes_attempted       :integer          default(0)
#  passes_completed       :integer          default(0)
#  red_card               :integer          default(0)
#  shots_attempted        :integer          default(0)
#  shots_off_target       :integer          default(0)
#  shots_on_target        :integer          default(0)
#  subs                   :integer          default(0)
#  tackles_attempted      :integer          default(0)
#  tackles_won            :integer          default(0)
#  yellow_card            :integer          default(0)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  season_id              :uuid             not null
#  team_id                :uuid             not null
#  user_id                :uuid             not null
#
# Indexes
#
#  index_statistics_on_season_id  (season_id)
#  index_statistics_on_team_id    (team_id)
#  index_statistics_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (season_id => seasons.id)
#  fk_rails_...  (team_id => teams.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class StatisticTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
