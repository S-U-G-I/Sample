class Tweet < ApplicationRecord
  mount_uploader :picture, PictureUploader
end
