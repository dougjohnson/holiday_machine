class User < ActiveRecord::Base
  devise :database_authenticatable, :confirmable, :lockable, :recoverable,
         :rememberable, :registerable, :trackable, :timeoutable, :validatable,
         :token_authenticatable

  after_create :create_allowance
  after_destroy :delete_allowance

  #TODO remove days_leave - this has been replaced by the user_days_for_years table

  belongs_to :user_type

  has_many :user_days

  has_many :vacations
  has_many :user_days_for_years

  validates_presence_of :email, :forename, :surname, :user_type

  attr_accessible :email, :password, :password_confirmation, :forename, :surname, :user_type_id, :manager_id

  scope :get_team_users, lambda { |manager_id| where('manager_id = ? or id = ?', manager_id, manager_id) }

  def full_name
    self[:forename] + " " + self[:surname]
  end

  def get_holiday_allowance
    today = Date.today
    holiday_year = HolidayYear.where('date_start<=? and date_end>=?', today, today).first
    allowance = UserDaysForYear.where("user_id = ? and holiday_year_id = ?", self.id, holiday_year.id).first
    allowance
  end

  def create_allowance
    today = Date.today
    holiday_year = HolidayYear.where('date_start<=? and date_end>=?', today, today).first
    days_allowed = UserDaysForYear.new(:user_id => self.id, :holiday_year_id => holiday_year.id)
    days_allowed.days_remaining=25
    days_allowed.save
  end

  def delete_allowance
    today = Date.today
    holiday_year = HolidayYear.where('date_start<=? and date_end>=?', today, today).first
    UserDaysForYear.destroy(:user_id => self.id, :holiday_year_id => holiday_year.id)
  end

end
