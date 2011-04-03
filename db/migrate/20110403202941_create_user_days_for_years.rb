class CreateUserDaysForYears < ActiveRecord::Migration
  def self.up
    create_table :user_days_for_years do |t|
      t.integer :days_remaining
      t.integer :user_id
      t.integer :holiday_year
      t.timestamps
    end
  end

  def self.down
    drop_table :user_days_for_years
  end
end
