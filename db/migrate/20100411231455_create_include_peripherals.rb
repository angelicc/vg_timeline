class CreateIncludePeripherals < ActiveRecord::Migration
  def self.up
    create_table :include_peripherals do |t|
      t.integer :game_id, :null => false
      t.integer :peripheral_id, :null => false
      t.integer :quantity, :null => false, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :include_peripherals
  end
end
