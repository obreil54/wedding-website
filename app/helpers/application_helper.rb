module ApplicationHelper
  WEDDING_DATE = Date.new(2026, 10, 16)

  def wedding_days_left
    (WEDDING_DATE - Time.zone.today).to_i
  end
end
