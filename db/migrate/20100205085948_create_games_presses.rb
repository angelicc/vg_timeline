class CreateGamesPresses < ActiveRecord::Migration
  def self.up
    create_table :games_press do |t|
      t.integer :game_id, :null => false
      t.integer :press_id, :null => false
      t.string :score, :null => false
      t.string :review_link

      t.timestamps
    end
  end

  def self.down
    drop_table :games_press
  end
end
