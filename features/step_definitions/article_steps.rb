Given /^I have articles titled "([^\"]*)" written by "([^\"]*)"$/ do |titles, user_email|
  user = User.find_by_email!(user_email.downcase)
  titles.split(', ').each { |title| Factory.create(:article, :title => title, :content => 'foo', :user => user) }
end

Given /^I have no articles$/ do
  Article.delete_all
end
