class CreateHolidays < ActiveRecord::Migration
  def self.up
    create_table :holidays do |t|
      t.date :date_from
      t.date :date_to
      t.string :description
      t.integer :user_id
      t.integer :admin_id

      t.timestamps
    end
  end

  def self.down
    drop_table :holidays
  end
end
