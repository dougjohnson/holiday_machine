class CreateHolidayStatuses < ActiveRecord::Migration
  def self.up
    create_table :holiday_statuses do |t|
      t.string :status
      t.timestamps
    end

#    add_column :vacations, :holiday_status_id, :integer
  end

  def self.down
    drop_table :holiday_statuses
  end
end
