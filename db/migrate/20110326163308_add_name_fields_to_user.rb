class AddNameFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :forename, :string, :limit => 80
    add_column :users, :surname, :string, :limit => 80
  end

  def self.down
  end
end
