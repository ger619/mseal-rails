class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :news, foreign_key: :user_id, class_name: 'News', dependent: :destroy
  has_many :clubs, foreign_key: :user_id, class_name: 'Club', dependent: :destroy
end
