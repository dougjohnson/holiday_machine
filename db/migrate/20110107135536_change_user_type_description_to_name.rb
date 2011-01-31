class ChangeUserTypeDescriptionToName < ActiveRecord::Migration
  def self.up
    rename_column :user_types, :description, :name
  end

  def self.down
  end
end
