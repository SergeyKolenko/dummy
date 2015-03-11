module LeadsHelper
  def time_rand from = Time.local(2000,1,1), to = Time.now
    Time.at(from + rand * (to.to_f - from.to_f))
  end
end
