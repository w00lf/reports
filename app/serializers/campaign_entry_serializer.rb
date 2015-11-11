class CampaignEntrySerializer < ActiveModel::Serializer
  attributes  :media_spend,
              :impressions,
              :clicks,
              :ctr,
              :conversions,
              :e_cpm,
              :e_cpc,
              :e_cpa,
              :spent
end