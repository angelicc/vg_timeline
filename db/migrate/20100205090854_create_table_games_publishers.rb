class CreateTableGamesPublishers < ActiveRecord::Migration
  def self.up
    create_table :games_publishers do |t|
      t.integer :game_id, :null => false
      t.integer :publisher_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :games_publishers
  end
end
