class CreateModifications < ActiveRecord::Migration
  def self.up
    create_table :modifications do |t|
      t.integer :user_id, :null => false
      t.string :description, :null => false
      t.boolean :delete, :default => false
      t.boolean :new, :default => false
      t.boolean :modified, :default => false
      t.integer :table_id, :null => false
      t.integer :modified_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :modifications
  end
end
