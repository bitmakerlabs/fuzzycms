FactoryGirl.define do
  factory :article do
    title "The title"
    body "This is the content"
  end

  factory :comment do
    body "this is the body"
    article
  end
end