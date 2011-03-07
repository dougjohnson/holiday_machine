class Vacation < ActiveRecord::Base

#  require "UUID"

  belongs_to :holiday_status
  belongs_to :user

  before_save :save_working_days

  scope :team_holidays, lambda {|manager_id| where(:manager_id => manager_id) }

  validates_presence_of :date_from
  validates_presence_of :date_to
  validates_presence_of :description

  validate :date_from_must_be_before_date_to
  validate :working_days_greater_than_zero
  validate :date_not_more_than_one_month_ago

#  TODO create UUID https://github.com/assaf/uuid
#  def uuid= val
#    guid = UUID.new
#    test = guid generate
#    self[:uuid] = guid.generate
#  end

  def date_from= val
    self[:date_from] = convert_uk_date_to_iso val
  end

  def date_to= val
    self[:date_to] = convert_uk_date_to_iso val
  end

  def self.holidays_as_json start_date, end_date
    #TODO restrict by team
    date_from = Time.at(start_date.to_i).to_date
    date_to = Time.at(end_date.to_i).to_date
    holidays = self.where "date_from >= ? and date_to <= ?", date_from, date_to
    bank_holidays = BankHoliday.where "date_of_hol between ? and ? ", date_from, date_to
    self.convert_to_json holidays, bank_holidays
  end

  private

  def self.convert_to_json holidays, bank_holidays
    #TODO the colour class should be per user not per holiday
    json  = []
    color = 0

    holidays.each do |hol|
      hol_hash = {:id => hol.id, :title=>hol.description, :start=>hol.date_from.to_s, :end=>hol.date_to.to_s, :className=>"holcolor" + color.to_s}
      json << hol_hash
      if color < 5
        color += 1;
      else
        color = 0;
      end
    end
    bank_holidays.each do |hol|
      hol_hash = {:id => hol.id, :title=>hol.name, :start=>hol.date_of_hol.to_s, :className=>"bankHol"}
      json << hol_hash
    end
    json
  end

  def date_from_must_be_before_date_to
    errors.add(:date_from, " must be before date to.") if date_from > date_to
  end

  def working_days_greater_than_zero
    @working_days = business_days_between
    errors.add(:working_days_used, " - This holiday request uses no working days") if @working_days==0
  end

  def date_not_more_than_one_month_ago
    errors.add(:date_from, "must be less than one month ago") if date_from < (Date.today - 1.month)
  end

  def convert_uk_date_to_iso date_str
    split_date=date_str.split("/")
    Date.new(split_date[2].to_i, split_date[1].to_i, split_date[0].to_i)
  end

  def save_working_days
    self[:working_days_used] = @working_days # = business_days_between
  end

  def business_days_between
    holidays       = BankHoliday.where("date_of_hol BETWEEN ? AND ?", date_from, date_to)
    holidays_array = holidays.collect { |hol| hol.date_of_hol }
    weekdays       = (date_from..date_to).reject { |d| [0, 6].include? d.wday or holidays_array.include?(d) }
    business_days  = weekdays.length
  end

end
