FactoryGirl.define do
  factory :campaign do
    name { Faker::Internet.user_name }
    start_date { 2.days.ago }
    end_date { 10.days.from_now }
    media_budget { 100.00 }
  end
end
