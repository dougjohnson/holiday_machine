class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.integer :year_start_day
      t.integer :year_start_month

      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end
