class ReportSerializer < ActiveModel::Serializer
  attributes :created_at
  has_many :comments

  def attributes
    super.merge(campaign_serializable_hash)
  end

  private

  def campaign_serializable_hash
    CampaignSerializer.new(object.campaign).serializable_hash
  end
end