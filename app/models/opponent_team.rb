class OpponentTeam < ApplicationRecord
  has_one_attached :team_badge

  validates :name, presence: true
  validates :team_badge, presence: true
end
