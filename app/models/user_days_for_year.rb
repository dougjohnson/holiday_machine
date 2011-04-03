class UserDaysForYear < ActiveRecord::Base
  #Holds no of days available per user per holiday year
  belongs_to :user
  belongs_to :holiday_year
end
