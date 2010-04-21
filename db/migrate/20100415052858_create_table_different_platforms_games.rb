class CreateTableDifferentPlatformsGames < ActiveRecord::Migration
  def self.up
    create_table :different_platforms_games, :id => false do |t|
      t.integer :different_platform_id
      t.integer :game_id
    end
  end

  def self.down
    drop_table :different_platforms_games
  end
end
