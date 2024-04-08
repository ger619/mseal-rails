# == Schema Information
#
# Table name: teams
#
#  id            :uuid             not null, primary key
#  about         :string
#  first_name    :string
#  image         :string
#  jersey_number :integer
#  last_name     :string
#  position      :string
#  second_name   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :uuid             not null
#
# Indexes
#
#  index_teams_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Team < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :jersey_number, presence: true, uniqueness: true

  def name
    "#{first_name} #{second_name} #{last_name}"
  end
end
