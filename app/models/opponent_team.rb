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
class OpponentTeam < ApplicationRecord
  has_one_attached :team_badge
  has_many :opponent, dependent: :destroy
  has_many :user, dependent: :destroy

  validates :name, presence: true
  validates :team_badge, presence: true
end
