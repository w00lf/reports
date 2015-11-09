require 'rails_helper'

RSpec.describe "campaigns/edit", type: :view do
  before(:each) do
    @campaign = assign(:campaign, Campaign.create!(
      :name => "MyString",
      :media_budget => "9.99",
      :media_spend => "9.99",
      :impressions => "",
      :clicks => "",
      :ctr => "9.99",
      :conversions => "",
      :e_cpm => "9.99",
      :e_cpc => "9.99",
      :e_cpa => "",
      :spent => "9.99"
    ))
  end

  it "renders the edit campaign form" do
    render

    assert_select "form[action=?][method=?]", campaign_path(@campaign), "post" do

      assert_select "input#campaign_name[name=?]", "campaign[name]"

      assert_select "input#campaign_media_budget[name=?]", "campaign[media_budget]"

      assert_select "input#campaign_media_spend[name=?]", "campaign[media_spend]"

      assert_select "input#campaign_impressions[name=?]", "campaign[impressions]"

      assert_select "input#campaign_clicks[name=?]", "campaign[clicks]"

      assert_select "input#campaign_ctr[name=?]", "campaign[ctr]"

      assert_select "input#campaign_conversions[name=?]", "campaign[conversions]"

      assert_select "input#campaign_e_cpm[name=?]", "campaign[e_cpm]"

      assert_select "input#campaign_e_cpc[name=?]", "campaign[e_cpc]"

      assert_select "input#campaign_e_cpa[name=?]", "campaign[e_cpa]"

      assert_select "input#campaign_spent[name=?]", "campaign[spent]"
    end
  end
end
