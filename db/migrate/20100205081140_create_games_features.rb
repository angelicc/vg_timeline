class CreateGamesFeatures < ActiveRecord::Migration
  def self.up
    create_table :games_features do |t|
      t.integer :game_id, :null => false
      t.integer :feature_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :games_features
  end
end
