class News < ApplicationRecord
  belongs_to :user, class_name: 'User', optional: true
  has_one_attached :image
end
