class Tweet < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :users
end
