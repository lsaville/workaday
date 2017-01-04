FactoryGirl.define do
  factory :project do
    lat Faker::Address.latitude
    lng Faker::Address.longitude
    title Faker::Book.title
    details Faker::Hipster.paragraph
  end
end
