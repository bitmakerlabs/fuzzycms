class Article < ActiveRecord::Base
  acts_as_commentable

  validates_presence_of :title, :content
end
