class LeadSource < ActiveRecord::Base
  attr_accessible :name, :lead_source_group_id
  belongs_to :lead_source_group
  has_many :leads

  validates :name, presence: true
  validates_associated :lead_source_group
end
