class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  mount_uploader :image, ImageUploader

  validates :title, presence: true
end
