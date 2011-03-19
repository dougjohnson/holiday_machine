class HolidayYear < ActiveRecord::Base

  has_many :vacations

  scope :holiday_years_containing_holiday, lambda{|date_start, date_end| where('date_start<=? and date_end>=?', date_start, date_end)}
#  scope :current_year, lambda {where('date_start<=? and date_end>=?', Date.today, Date.today).first}

  def self.current_year
    today = Date.today
    self.where('date_start<=? and date_end>=?', today, today).first
  end

end
