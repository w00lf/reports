FactoryGirl.define do
  factory :user do
    sequence(:email) { Faker::Internet.email }
    sequence(:username) { Faker::Internet.user_name }
    password 'password'
    password_confirmation 'password'
  end
end
