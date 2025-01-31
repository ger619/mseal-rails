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
#  season_id        :uuid
#  user_id          :uuid             not null
#
# Indexes
#
#  index_opponents_on_opponent_team_id  (opponent_team_id)
#  index_opponents_on_season_id         (season_id)
#  index_opponents_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (opponent_team_id => opponent_teams.id)
#  fk_rails_...  (season_id => seasons.id)
#  fk_rails_...  (user_id => users.id)
#
class Opponent < ApplicationRecord
  belongs_to :user, class_name: 'User', optional: true
  belongs_to :opponent_team
  before_validation :capitalize
  belongs_to :season
  has_many :scorers, foreign_key: :opponent_id, class_name: 'Scorer', dependent: :destroy
  # validates :match_date, :match_time, :tournament, :venue, presence: true

  def capitalize
    self.tournament = tournament.capitalize
    self.venue = venue.capitalize
  end

  # Value  should be zero or more than zero should not be negative
  # validates :score_one, :score_two, numericality: { greater_than_or_equal_to: 0 }
end
