class LeadSourceGroup < ActiveRecord::Base
  attr_accessible :name

  has_many :lead_sources

  validates :name, presence: true
end
