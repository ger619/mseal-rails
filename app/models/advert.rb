class Advert < ApplicationRecord
  belongs_to :user, class_name: 'User', optional: true
  has_one_attached :mobile_image
  has_one_attached :desk_image
end
