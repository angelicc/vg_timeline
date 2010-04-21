class CreateTableGamesPeripherals < ActiveRecord::Migration
  def self.up
    create_table :games_peripherals, :id => false do |t|
      t.integer :game_id
      t.integer :peripheral_id
    end
  end

  def self.down
    drop_table :games_peripherals
  end
end
