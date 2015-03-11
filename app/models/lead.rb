class Lead < ActiveRecord::Base
  attr_accessible :contract_id, :interested_company_id, :lead_source, :status

  validates :interested_company, :presence => true

  belongs_to :interested_company, :class_name => 'BusinessEntity'

  scope :not_spam, -> { where('status not in (?)', %w(spam)) }
  scope :closed, -> { where('status in (?)', %w(closed job_done))}
  scope :opened, -> { where('status in (?)', %w(open in_progress pending))}
end
