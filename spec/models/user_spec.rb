require 'rails_helper'

RSpec.describe User, type: :model do
  it "Creates valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "Validates username uniqueness" do
    user = FactoryGirl.create(:user)
    expect(FactoryGirl.build(:user, username: user.username)).to_not be_valid
  end
end