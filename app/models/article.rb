class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :category

  mount_uploader :image, ImageUploader

  validates :title, presence: true
end
