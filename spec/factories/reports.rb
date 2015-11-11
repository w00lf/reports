FactoryGirl.define do
  factory :report do
    campaign
    pdf { File.open(Rails.root.join('spec/test.pdf')) }
  end
end
