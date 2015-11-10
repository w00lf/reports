FactoryGirl.define do
  factory :campaign_entry do
    media_spend { 100.00 }
    impressions { 21.1 }
    clicks { 233 }
    ctr { 0.1 }
    conversions { 5.4 }
    e_cpm { 6.5 }
    e_cpc { 6.5 }
    e_cpa { 6.5 }
    spent { 6.5 }
    campaign
  end
end
