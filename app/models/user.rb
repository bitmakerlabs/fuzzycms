class User < ActiveRecord::Base
  acts_as_authentic do |u|
    u.login_field = :email
  end

  has_many :assignments
  has_many :roles, :through => :assignments
  
  has_many :comments
  has_many :articles


  validates_presence_of :first_name, :last_name

  
  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end


  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end

  def full_name
    first_name + ' ' + last_name
  end
end
