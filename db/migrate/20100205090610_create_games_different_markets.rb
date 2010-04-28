class CreateGamesDifferentMarkets < ActiveRecord::Migration
  def self.up
    create_table :games_different_markets do |t|
      t.integer :game_id, :null => false
      t.integer :diff_market_game_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :games_different_markets
  end
end
