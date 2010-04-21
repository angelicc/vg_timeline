class CreateTableAchievementsGames < ActiveRecord::Migration
  def self.up
    create_table :achievements_games, :id => false do |t|
      t.integer :achievement_id
      t.integer :game_id
    end
  end

  def self.down
    drop_table :achievements_games
  end
end
