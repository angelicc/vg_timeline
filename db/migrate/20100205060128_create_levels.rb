class CreateLevels < ActiveRecord::Migration
  def self.up
    create_table :levels do |t|
      t.string :name, :limit => 100, :null => false
      t.integer :new_games, :limit => 11, :null => false
      t.integer :modifications, :limit => 11, :null => false
      t.boolean :delete_games, :default => false, :null => false
      t.boolean :add_categories, :default => false, :null => false
      t.boolean :manage_users, :default => false, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :levels
  end
end
