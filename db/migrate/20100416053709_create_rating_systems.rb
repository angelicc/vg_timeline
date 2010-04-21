class CreateRatingSystems < ActiveRecord::Migration
  def self.up
    create_table :rating_systems do |t|
      t.string :name, :null => false
      t.integer :market_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :rating_systems
  end
end
