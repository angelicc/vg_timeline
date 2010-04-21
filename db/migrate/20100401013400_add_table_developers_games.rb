class AddTableDevelopersGames < ActiveRecord::Migration
  def self.up
    create_table :developers_games, :id => false do |t|
      t.integer :developer_id
      t.integer :game_id
    end
  end

  def self.down
    drop_table :developers_games
  end
end
