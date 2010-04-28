class CreateTableGamesPeripherals < ActiveRecord::Migration
  def self.up
    create_table :games_peripherals do |t|
      t.integer :game_id, :null => false
      t.integer :peripheral_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :games_peripherals
  end
end
