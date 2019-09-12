class Tweet < ApplicationRecord
  mount_uploader :picture, PictureUploader
  validates :description, :picture, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
end
