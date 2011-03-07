class CreateHolidayYears < ActiveRecord::Migration
  def self.up
    create_table :holiday_years do |t|
      t.date :date_start
      t.date :date_end

      t.timestamps
    end
  end

  def self.down
    drop_table :holiday_years
  end
end
