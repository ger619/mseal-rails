# == Schema Information
#
# Table name: opponent_teams
#
#  id         :uuid             not null, primary key
#  name       :string
#  team_url   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class OpponentTeam < ApplicationRecord
  has_one_attached :team_badge
  has_many :opponent, dependent: :destroy

  validates :name, presence: true
  validates :team_badge, presence: true
end
