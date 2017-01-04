FactoryGirl.define do
  factory :project do
    lat Faker::Address.latitude
    lng Faker::Address.longitude
    title Faker::Book.title
    description Faker::Hipster.paragraph
  end
end
