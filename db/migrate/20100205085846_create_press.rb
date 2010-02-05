class CreatePress < ActiveRecord::Migration
  def self.up
    create_table :press do |t|
      t.string :name, :null => false
      t.string :url
      t.string :region
      t.integer :market_id

      t.timestamps
    end
  end

  def self.down
    drop_table :press
  end
end
