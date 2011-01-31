class AddDaysLeaveToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :days_leave, :integer
  end

  def self.down
    remove_column :users, :days_leave
  end
end
