class Report < ActiveRecord::Base
  belongs_to :campaign

  validates :campaign, presence: true
end
