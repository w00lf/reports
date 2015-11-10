require 'rails_helper'

RSpec.describe Campaign, type: :model do
  it "Creates valid factory" do
    expect(FactoryGirl.build(:campaign)).to be_valid
  end
end
