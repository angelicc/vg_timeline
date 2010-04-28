class CreateTableGamesDevelopers < ActiveRecord::Migration
  def self.up
    create_table :games_developers do |t|
      t.integer :game_id, :null => false
      t.integer :developer_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :games_developers
  end
end
