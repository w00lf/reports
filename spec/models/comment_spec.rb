require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "Creates valid factory" do
    expect(FactoryGirl.build(:comment)).to be_valid
  end

  it "Validates description max size" do
    expect(FactoryGirl.build(:comment, description: Faker::Lorem.sentence(200))).to_not be_valid
  end
end
