class ChangeUserDaysForYear < ActiveRecord::Migration
  def self.up
    rename_column :user_days_for_years, :holiday_year, :holiday_year_id
  end

  def self.down
  end
end
