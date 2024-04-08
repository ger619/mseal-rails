# == Schema Information
#
# Table name: news
#
#  id           :uuid             not null, primary key
#  body         :string
#  header_news  :string
#  image        :string
#  type_of_news :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :uuid             not null
#
# Indexes
#
#  index_news_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class News < ApplicationRecord
  belongs_to :user, class_name: 'User', optional: true
  has_one_attached :image
  # Validations on a model
  validates :type_of_news, presence: true
  validates :header_news, presence: true
  validates :body, presence: true
  validates :image, presence: true
end
