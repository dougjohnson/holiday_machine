class ChangeUserTypeIdColumnType < ActiveRecord::Migration
  def self.up
    change_column :users, :user_type_id, :integer
  end

  def self.down
    #Don't do that
  end
end
