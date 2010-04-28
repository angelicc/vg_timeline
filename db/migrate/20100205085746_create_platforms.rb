class CreatePlatforms < ActiveRecord::Migration
  def self.up
    create_table :platforms do |t|
      t.string :name, :null => false
      t.integer :publisher_id, :null => false
      t.text :description
      t.integer :generation
      t.integer :controller_ports
      t.boolean :online_connectivity, :default => false, :null => false
      t.integer :precursor_id
      t.integer :platform_market_id
      t.float :overall_sales
      t.string :logo
      t.string :picture
      t.integer :addon_id
      t.string :storage

      t.timestamps
    end
  end

  def self.down
    drop_table :platforms
  end
end
