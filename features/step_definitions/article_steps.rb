Given /^I have articles titled (.+)$/ do |titles|
  titles.split(', ').each { |title| Article.create!(:title => title) }
end

Given /^I have no articles$/ do
  Article.delete_all
end
