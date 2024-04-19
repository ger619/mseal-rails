# == Schema Information
#
# Table name: opponents
#
#  id               :uuid             not null, primary key
#  match_date       :date
#  match_time       :time
#  score_one        :integer
#  score_two        :integer
#  tournament       :string
#  venue            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  opponent_team_id :uuid
#  user_id          :uuid             not null
#
# Indexes
#
#  index_opponents_on_opponent_team_id  (opponent_team_id)
#  index_opponents_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (opponent_team_id => opponent_teams.id)
#  fk_rails_...  (user_id => users.id)
#
class Opponent < ApplicationRecord
  belongs_to :user
  belongs_to :opponent_team

  def daily_opponent
    Opponent.where('match_date >= ?', Date.today).order('match_date ASC')
  end

  def match_score
    # Display last match where it has scores
    Opponent.where('match_date <= ?', Date.today).where.not(score_one: nil).where.not(score_two: nil).last
  end
end
