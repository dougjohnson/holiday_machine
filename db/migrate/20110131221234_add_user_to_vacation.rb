class AddUserToVacation < ActiveRecord::Migration
  def self.up
    add_column :vacations, :user_id, :integer
  end

  def self.down
    remove_column :vacations, :user_id
  end
end
