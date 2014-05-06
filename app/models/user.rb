class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :articles

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  # we be seeing this later this week, mon
  ADMIN = 'admin'
  AUTHOR = 'author'

  ROLES = [ADMIN, AUTHOR]

  def is?(requested_role)
    role == requested_role
  end
end
