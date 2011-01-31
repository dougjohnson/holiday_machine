class AddHolidayStatusToVacations < ActiveRecord::Migration
  def self.up
    add_column :vacations, :holiday_status_id, :integer
  end

  def self.down
  end
end
