require 'rails_helper'

RSpec.describe CampaignEntry, type: :model do
  it "Creates valid factory" do
    expect(FactoryGirl.build(:campaign_entry)).to be_valid
  end

  it "Validates campaign presense" do
    expect(FactoryGirl.build(:campaign_entry, campaign: nil)).to_not be_valid
  end
end
