class Comment < ActiveRecord::Base
  belongs_to :report

  validates :description, length: { maximum: 160 }
end
