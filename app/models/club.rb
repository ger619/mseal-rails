class Club < ApplicationRecord
  belongs_to :user, class_name: 'User', optional: true
  has_one_attached :photo
end
