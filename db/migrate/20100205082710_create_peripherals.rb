class CreatePeripherals < ActiveRecord::Migration
  def self.up
    create_table :peripherals do |t|
      t.string :name, :null => false
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :peripherals
  end
end
