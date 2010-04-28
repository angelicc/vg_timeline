class CreateTableGamesGenres < ActiveRecord::Migration
  def self.up
    create_table :games_genres do |t|
      t.integer :game_id, :null => false
      t.integer :genre_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :games_genres
  end
end
