require 'rails_helper'

RSpec.describe "campaigns/index", type: :view do
  before(:each) do
    assign(:campaigns, [
      Campaign.create!(
        :name => "Name",
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
      ),
      Campaign.create!(
        :name => "Name",
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
      )
    ])
  end

  it "renders a list of campaigns" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
