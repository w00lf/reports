require 'rails_helper'

RSpec.describe Report, type: :model do
  it "Creates valid factory" do
    expect(FactoryGirl.build(:report)).to be_valid
  end

  it "Validates campaign presense" do
    expect(FactoryGirl.build(:report, campaign: nil)).to_not be_valid
  end

  it "Validates pdf presense" do
    expect(FactoryGirl.build(:report, pdf: nil)).to_not be_valid
  end
end
