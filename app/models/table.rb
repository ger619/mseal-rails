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
class Table < ApplicationRecord
  belongs_to :opponent_team
  belongs_to :user
  belongs_to :season

  def gd
    (gf - ga)
  end

  def pts
    (w * 3) + d
  end

  def games_played
    # Matches W + D + L
    w + d + l
  end

  validates :w, :d, :l, :gf, :ga, :opponent_team_id, :season_id, :user_id, presence: true
  validates :w, :d, :l, :gf, :ga, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :opponent_team_id, uniqueness: true

  # To place a number sequentially from one to the last number of the table
  def rank
    Table.order(Arel.sql('w * 3 + d DESC'), Arel.sql('gf - ga DESC')).index(self) + 1
  end

  def self.search_by_season(season_id)
    if season_id.present?
      where(season_id: season_id)
    else
      all
    end
  end
end
