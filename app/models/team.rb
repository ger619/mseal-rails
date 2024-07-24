# == Schema Information
#
# Table name: teams
#
#  id            :uuid             not null, primary key
#  active        :boolean
#  date_of_birth :date
#  first_goal    :string
#  first_name    :string
#  instagram     :string           default("https://www.instagram.com/")
#  jersey_number :integer
#  last_name     :string
#  mseal_debut   :string
#  position      :string
#  previous_club :string
#  second_name   :string
#  twitter       :string           default("https://x.com/home")
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
  has_rich_text :content

  before_validation :capitalize
  has_many :statistics, foreign_key: :team_id, class_name: 'Statistic', dependent: :destroy
  has_many :scorers, foreign_key: :team_id, class_name: 'Scorer', dependent: :destroy

  validates :jersey_number, presence: true, uniqueness: true
  validates :active, inclusion: { in: [true, false], default: false }
  validates :first_name, :second_name, :last_name, :position, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def capitalize
    self.first_name = first_name.capitalize
    self.last_name = last_name.capitalize
    self.second_name = second_name.capitalize
  end

  def age
    return unless date_of_birth.present?

    now = Time.now.utc.to_date
    now.year - date_of_birth.year - (date_of_birth.to_date.change(year: now.year) > now ? 1 : 0)
  end
end
