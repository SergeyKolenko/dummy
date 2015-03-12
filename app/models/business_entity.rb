class BusinessEntity < ActiveRecord::Base
  attr_accessible :name, :name_short

  has_many :leads

  def name_short_or_name
    name_short.presence || name.presence || 'Name not set'
  end
end
