class UserDay < ActiveRecord::Base

  belongs_to :user
  belongs_to :holiday_year

  validates_presence_of :user_id
  validates_presence_of :no_days
  validates_numericality_of :no_days

end
