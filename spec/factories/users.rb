FactoryGirl.define do
  factory :user do
    provider "google_oauth2"
    uid Faker::Number.number(10)
    name Faker::Name.last_name
    email Faker::Internet.email
    avatar_url 'www.example.com'
    oauth_token Faker::Number.number(7)
    oauth_expires_at Faker::Time.forward(30, :morning)
  end
end
