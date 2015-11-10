class CampaignEntry < ActiveRecord::Base
  belongs_to :campaign

  validates :campaign, presence: true
end
