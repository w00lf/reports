class CampaignSerializer < ActiveModel::Serializer
  attributes :name, :start_date, :end_date, :media_budget
  has_many :campaign_entries
end