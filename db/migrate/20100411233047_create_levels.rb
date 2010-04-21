class CreateLevels < ActiveRecord::Migration
  def self.up
    create_table :levels do |t|
      t.string :name, :null => false
      t.integer :new_games, :null => false
      t.integer :modifications, :null => false
      t.boolean :delete_dames, :null => false, :default => false
      t.boolean :add_categories, :null => false, :default => false
      t.boolean :manage_users, :null => false, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :levels
  end
end
