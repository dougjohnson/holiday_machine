class CreateUserTypes < ActiveRecord::Migration
  def self.up
    create_table :user_types do |t|
      t.string :description

      t.timestamps
    end

    add_column :users, :user_type_id, :string
  end

  def self.down
    drop_table :user_types
  end
end
