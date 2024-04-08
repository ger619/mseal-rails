# == Schema Information
#
# Table name: hall_of_fames
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :uuid             not null
#
# Indexes
#
#  index_hall_of_fames_on_team_id  (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#
class HallOfFame < ApplicationRecord
  belongs_to :team
end