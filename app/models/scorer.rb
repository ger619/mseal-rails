# == Schema Information
#
# Table name: scorers
#
#  id          :uuid             not null, primary key
#  assists     :integer
#  goals       :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  opponent_id :uuid             not null
#  team_id     :uuid             not null
#  user_id     :uuid             not null
#
# Indexes
#
#  index_scorers_on_opponent_id  (opponent_id)
#  index_scorers_on_team_id      (team_id)
#  index_scorers_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (opponent_id => opponents.id)
#  fk_rails_...  (team_id => teams.id)
#  fk_rails_...  (user_id => users.id)
#
class Scorer < ApplicationRecord
  belongs_to :team
  belongs_to :user
  belongs_to :opponent
end
