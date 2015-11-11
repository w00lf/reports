class Report < ActiveRecord::Base
  has_many :comments, ->{ order('created_at DESC') }
  belongs_to :campaign

  has_attached_file :pdf

  validates_attachment_content_type :pdf, content_type: ["application/pdf"]
  validates_attachment_presence :pdf
  validates :campaign, presence: true

  accepts_nested_attributes_for :comments
end
