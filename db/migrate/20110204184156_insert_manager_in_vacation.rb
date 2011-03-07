class InsertManagerInVacation < ActiveRecord::Migration
  def self.up
    add_column :vacations, :manager_id, :integer
  end

  def self.down
    remove_column :vacations, :manager_id
  end
end
