Given /^I have articles titled "([^\"]*)" written by "([^\"]*)"$/ do |titles, user_email|
  user = User.find_by_email(user_email)
  titles.split(', ').each { |title| Factory(:article, :title => title, :author => user) }
end

Given /^I have no articles$/ do
  Article.delete_all
end
