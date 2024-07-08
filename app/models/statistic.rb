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
class Statistic < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :season, class_name: 'Season', optional: true

  # Passes attempted should always be greater than passes completed

  validates :matches_played, :minutes_played, :matches_started, :subs, numericality: { greater_than_or_equal_to: 0 },
                                                                       presence: true
  validates :tackles_won, :tackles_attempted, :duel_won, :interception_won, :interception_attempted,
            numericality: { greater_than_or_equal_to: 0 }, presence: true
  # errors.add(:passes_attempted, 'should be greater than passes completed') if passes_attempted < passes_completed
  validates :passes_completed, :passes_attempted, numericality: { greater_than_or_equal_to: 0 }, presence: true

  validates :shots_on_target, :shots_attempted, :goals_scored, :assists,
            numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :yellow_card, :red_card, :fouls_committed, :fouls_won, numericality: { greater_than_or_equal_to: 0 },
                                                                   presence: true
  validates :team_id, uniqueness: true

  def name
    # Pick team name from the team and display it
    "#{Team.first_name} #{Team.last_name}"
  end

  def tackles_percentage
    if tackles_attempted.positive? && tackles_attempted >= tackles_won
      ((tackles_won.to_f / tackles_attempted) * 100).round(2)
    else
      0
    end
  end

  def duel_percentage
    if duel_attempted.positive? && duel_attempted >= duel_won
      ((duel_won.to_f / duel_attempted) * 100).round(2)
    else
      0
    end
  end

  def interception_percentage
    if interception_attempted.positive? && interception_attempted >= interception_won
      ((interception_won.to_f / interception_attempted) * 100).round(2)
    else
      0
    end
  end

  def passes_percentage
    if passes_attempted.positive? && passes_attempted >= passes_completed
      ((passes_completed.to_f / passes_attempted) * 100).round(2)
    else
      0
    end
  end

  def shots_off_target
    if shots_attempted.positive? && shots_attempted >= shots_on_target

      shots_attempted - shots_on_target
    else
      0
    end
  end

  def shot_accuracy
    if shots_attempted.positive? && shots_attempted >= shots_on_target
      ((shots_on_target.to_f / shots_attempted) * 100).round(2)
    else
      0
    end
  end

  def goals_per_match
    if matches_played.positive?
      (goals_scored.to_f / matches_played).round(2)
    else
      0
    end
  end
end
