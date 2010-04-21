class CreateTableGamesDifferentMarkets < ActiveRecord::Migration
  def self.up
    create_table :different_markets_games, :id => false do |t|
      t.integer :different_market_id
      t.integer :game_id
    end
  end

  def self.down
    drop_table :different_markets_games
  end
end
