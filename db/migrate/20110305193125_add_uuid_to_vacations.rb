class AddUuidToVacations < ActiveRecord::Migration
  def self.up
    add_column :vacations, :uuid, :string
  end

  def self.down
    remove_column :vacations, :uuid
  end
end
