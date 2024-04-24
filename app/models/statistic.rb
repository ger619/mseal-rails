# == Schema Information
#
# Table name: statistics
#
#  id                :uuid             not null, primary key
#  fkfcup_appearance :integer
#  fkfcup_goal       :integer
#  fkfcup_redcard    :integer
#  fkfcup_yellow     :integer
#  kpl_appearance    :integer
#  kpl_goal          :integer
#  kpl_redcard       :integer
#  kpl_yellow        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  team_id           :uuid             not null
#  user_id           :uuid             not null
#
# Indexes
#
#  index_statistics_on_team_id  (team_id)
#  index_statistics_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#  fk_rails_...  (user_id => users.id)
#
class Statistic < ApplicationRecord
  belongs_to :team
  belongs_to :user

  validates :fkfcup_appearance, :fkfcup_goal, :fkfcup_redcard, :fkfcup_yellow, :kpl_appearance, :kpl_goal,
            :kpl_redcard, :kpl_yellow, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :team_id, uniqueness: true
end
