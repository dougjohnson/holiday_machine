class AddNotesToVacation < ActiveRecord::Migration
  def self.up
    add_column :vacations, :notes, :text
  end

  def self.down
    remove_column :vacations, :notes
  end
end
