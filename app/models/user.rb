# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("user"), not null
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  # Include default devise modules. Others available are:

  enum role: %i[user moderator admin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end

  has_many :news, foreign_key: :user_id, class_name: 'News', dependent: :destroy
  has_many :clubs, foreign_key: :user_id, class_name: 'Club', dependent: :destroy
  has_many :adverts, foreign_key: :user_id, class_name: 'Advert', dependent: :destroy
  has_many :opponents, foreign_key: :user_id, class_name: 'Opponent', dependent: :destroy
  has_many :opponent_teams, foreign_key: :user_id, class_name: 'OpponentTeam', dependent: :destroy
  has_many :statistics, foreign_key: :user_id, class_name: 'Statistic', dependent: :destroy
  has_many :teams, foreign_key: :user_id, class_name: 'Team', dependent: :destroy
  has_many :scorers, foreign_key: :user_id, class_name: 'Scorer', dependent: :destroy
end
