# == Schema Information
#
# Table name: news
#
#  id           :uuid             not null, primary key
#  header_news  :string
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
  has_rich_text :content

  # Add file and resize image
  # Validations on a model
  validates :type_of_news, :header_news, :content, :image, presence: true

  def time_taken
    time_diff = Time.now - created_at
    if time_diff < 1.hour
      "#{(time_diff / 1.minute).round} minutes"
    else
      "#{(time_diff / 1.hour).round} hours"
    end
  end
end
