class AddDaysleaveToAdmins < ActiveRecord::Migration
def self.up
    add_column :admins, :days_leave, :integer
  end

  def self.down
    remove_column :admins, :days_leave
  end
end
