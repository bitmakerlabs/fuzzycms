Given /^I have a user called "([^\"]*)" with a password of "([^\"]*)"$/ do |full_name, password|
  first_name, last_name = full_name.split(" ")
  email = first_name + "@example.com"
  @user = User.create!(:first_name => first_name, :last_name => last_name, :password => password, :password_confirmation => password, :email => email.downcase)
end
