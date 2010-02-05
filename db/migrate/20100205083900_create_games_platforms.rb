class CreateGamesPlatforms < ActiveRecord::Migration
  def self.up
    create_table :games_platforms do |t|
      t.integer :game_id, :null => false
      t.integer :platform_id, :null => false
      t.float :platform_sales

      t.timestamps
    end
  end

  def self.down
    drop_table :games_platforms
  end
end
