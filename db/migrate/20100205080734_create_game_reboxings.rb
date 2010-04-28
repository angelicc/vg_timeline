class CreateGameReboxings < ActiveRecord::Migration
  def self.up
    create_table :game_reboxings do |t|
      t.integer :game_id, :null => false
      t.string :boxart
      t.date :release_date

      t.timestamps
    end
  end

  def self.down
    drop_table :game_reboxings
  end
end
