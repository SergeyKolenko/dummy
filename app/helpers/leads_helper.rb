module LeadsHelper
  def time_rand from = 5.days.ago, to = Time.now
    Time.at(from + rand * (to.to_f - from.to_f))
  end
end
