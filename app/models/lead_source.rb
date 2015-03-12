class LeadSource < ActiveRecord::Base
  attr_accessible :name, :lead_source_group_id
  belongs_to :lead_source_group
  has_many :leads

  validates :name, presence: true
  validates_associated :lead_source_group

  def self.for_select
    sources = self.all
    sources.inject({}) do |options, lead_source|
      (options[lead_source.lead_source_group.name] ||= []) << [lead_source.name, lead_source.id]
      options
    end
  end

end
