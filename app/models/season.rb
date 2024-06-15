# == Schema Information
#
# Table name: seasons
#
#  id         :uuid             not null, primary key
#  end_date   :date
#  name       :string
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_seasons_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Season < ApplicationRecord
  belongs_to :user
  has_many :statistics, foreign_key: :season_id, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
