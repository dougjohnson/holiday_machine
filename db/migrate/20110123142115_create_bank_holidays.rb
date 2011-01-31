class CreateBankHolidays < ActiveRecord::Migration
  def self.up
    create_table :bank_holidays do |t|
      t.string :name
      t.date :date_of_hol

      t.timestamps
    end
  end

  def self.down
    drop_table :bank_holidays
  end
end
