class HolidayYear < ActiveRecord::Base

  has_many :vacations
  has_many :user_days_for_years

  scope :holiday_years_containing_holiday, lambda{|date_start, date_end| where('date_start<=? and date_end>=?', date_start, date_end)}

  def self.current_year
    today = Date.today
    self.where('date_start<=? and date_end>=?', today, today).first
  end

end
