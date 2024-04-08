class Opponent < ApplicationRecord
  belongs_to :user
  belongs_to :opponent_team
end
