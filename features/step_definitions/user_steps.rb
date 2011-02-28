Given /^I have a user called "([^\"]*)" with a password of "([^\"]*)"$/ do |full_name, password|
  first_name, last_name = full_name.split(" ")
  Factory(:user, :first_name => first_name, :last_name => last_name, :password => password, :password_confirmation => password, :email => first_name + "@example.com")
end

Given /^Login as Frodo Baggins$/ do
  steps %Q{
    Given I have a user called "Frodo Baggins with a password of "password
    When I go to the home page
    And I follow "Login"
    And I fill in "frodo@example.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Login"
  }
end