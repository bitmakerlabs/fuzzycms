require 'faker'

Factory.define :article do |a|
  a.title Faker::Lorem.words
  a.content Faker::Lorem.paragraphs
end

Factory.define :user do |u|
  u.email Faker::Internet.email
  u.password "password"
  u.password_confirmation "password"

  u.first_name Faker::Name.first_name
  u.last_name Faker::Name.last_name
end