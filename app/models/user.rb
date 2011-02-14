class User < ActiveRecord::Base
  acts_as_authentic do |u|
    u.login_field = :email
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end

  def full_name
    first_name + ' ' + last_name
  end
end
