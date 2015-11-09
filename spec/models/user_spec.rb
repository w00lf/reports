require 'rails_helper'
require 'spec-helper'

RSpec.describe User, type: :model do
  it "Creates valid factory" do
    expect(build(:user)).to be_valid
  end

  it "Validates username uniqueness" do
    user = create(:user)
    expect(build(:user, username: user.username)).to_not be_valid
  end
end
