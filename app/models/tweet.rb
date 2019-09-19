class Tweet < ApplicationRecord
  mount_uploader :picture, PictureUploader
  validates :description, :picture, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
 has_many :replies, class_name: "Comment", foreign_key: :reply_id, dependent: :destroy
end
