class HolidayStatus < ActiveRecord::Base
  has_one :vacation

  scope :user_statuses, lambda { |user_type_name|
     if user_type_name == "Manager"
       all
     else
       where self.status != "Pending" and self.status != "Cancelled"
     end
     }

  def self.conditions_mgr
    conditions=[]
    conditions << self.status !="Pending" and self.status != "Cancelled"
  end
end
