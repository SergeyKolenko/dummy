class LeadSource < ActiveRecord::Base
  attr_accessible :name, :lead_source_group
  belongs_to :lead_source_group

  validates :name, presence: true
  validates_associated :lead_source_group
end
