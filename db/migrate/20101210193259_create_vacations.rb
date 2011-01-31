class CreateVacations < ActiveRecord::Migration
  def self.up
    create_table :vacations do |t|
      t.date :date_from
      t.date :date_to
      t.string :description
      t.integer :days_left

      t.timestamps
    end
  end

  def self.down
    drop_table :vacations
  end
end
