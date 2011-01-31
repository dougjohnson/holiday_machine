class ChangeVacationDaysLeftToDaysUsed < ActiveRecord::Migration
  def self.up
    rename_column :vacations, :days_left, :working_days_used
  end

  def self.down
  end
end
