class Article < ActiveRecord::Base
  has_many :comments

  has_many :taggings
  has_many :tags, through: :taggings

  belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :category

  mount_uploader :image, ImageUploader

  validates :title, presence: true

  def self.tagged_with(name)
  	Tag.where(:name => name).take!.articles #equivalent to LIMIT 1 (grabs the first record)
  end

  def self.tag_counts
  	Tag.select("tags.id, tags.name, count(taggings.tag_id) as count").
    joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
  end

  def tag_list
  	tags.map(&:name).join(", ")
  end

  def tag_list=(names)
  	self.tags = names.split(", ").map do |n|
  		Tag.where(name: n.strip).first_or_create! #throws an exception if tag can't be created
  	end
  end
end
