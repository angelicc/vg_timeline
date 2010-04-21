class CreateTableGamesFeatures < ActiveRecord::Migration
  def self.up
    create_table :features_games, :id => false do |t|
      t.integer :feature_id
      t.integer :game_id
    end
  end

  def self.down
    drop_table :features_games
  end
end
