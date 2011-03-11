class Article < ActiveRecord::Base
  acts_as_commentable
  acts_as_logable

  belongs_to :user, :class_name => "User"

  validates_presence_of :title, :content
  validates_presence_of :user

  scope :recent, order("created_at DESC").limit(3)


  def name
    title
  end

  def author
    user
  end

  def author=(user)
    self.user = user
  end


end
