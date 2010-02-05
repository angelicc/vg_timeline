class CreateGamesMarkets < ActiveRecord::Migration
  def self.up
    create_table :games_markets do |t|
      t.integer :game_id, :null => false
      t.integer :market_id, :null => false
      t.float :market_sales

      t.timestamps
    end
  end

  def self.down
    drop_table :games_markets
  end
end
