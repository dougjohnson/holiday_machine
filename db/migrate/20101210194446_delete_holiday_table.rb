class DeleteHolidayTable < ActiveRecord::Migration
  def self.up
    drop_table :holidays
  end

  def self.down
  end
end
