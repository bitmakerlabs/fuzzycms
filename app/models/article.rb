class Article < ActiveRecord::Base
  acts_as_commentable

  belongs_to :author, :class_name => "User", :foreign_key => "user_id"

  validates_presence_of :title, :content
  validates_presence_of :author
end
