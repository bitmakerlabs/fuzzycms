require 'faker'

Factory.define :article do |a|
  a.title Faker::Lorem.words.join(" ")
  a.content Faker::Lorem.paragraphs.join("\n")
  a.association :author
end

Factory.define :user do |u|
  u.email {Factory.next(:email)}
  u.password "password"
  u.password_confirmation "password"

  u.first_name Faker::Name.first_name
  u.last_name Faker::Name.last_name
end

Factory.define :author, :parent => :user do |a|

end

Factory.sequence :email do |n|
  "person#{n}@example.com"
end