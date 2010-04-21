class CreateTableGamesGenres < ActiveRecord::Migration
  def self.up
    create_table :games_genres, :id => false do |t|
      t.integer :game_id
      t.integer :genre_id
    end
  end

  def self.down
    drop_table :games_genres
  end
end
