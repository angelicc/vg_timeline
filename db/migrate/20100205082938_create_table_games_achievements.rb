class CreateTableGamesAchievements < ActiveRecord::Migration
  def self.up
    create_table :games_achievements do |t|
      t.integer :game_id, :null => false
      t.integer :achievements_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :games_achievements
  end
end
