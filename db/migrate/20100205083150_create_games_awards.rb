class CreateGamesAwards < ActiveRecord::Migration
  def self.up
    create_table :games_awards do |t|
      t.integer :game_id, :null => false
      t.integer :press_id, :null => false
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :games_awards
  end
end
