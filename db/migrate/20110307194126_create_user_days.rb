class CreateUserDays < ActiveRecord::Migration
  def self.up
    create_table :user_days do |t|
      t.integer :user_id
      t.integer :no_days
      t.string :reason, :limit   => 100
      t.integer :holiday_year_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_days
  end
end
