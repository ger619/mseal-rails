# == Schema Information
#
# Table name: clubs
#
#  id         :uuid             not null, primary key
#  header     :string
#  photo      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_clubs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Club < ApplicationRecord
  belongs_to :user, class_name: 'User', optional: true
  has_one_attached :photo
  has_rich_text :content
end
