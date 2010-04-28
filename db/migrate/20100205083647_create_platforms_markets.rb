class CreatePlatformsMarkets < ActiveRecord::Migration
  def self.up
    create_table :platforms_markets do |t|
      t.integer :platform_id, :null => false
      t.integer :market_id, :null => false
      t.float :market_sales
      t.date :release_date, :null => false
      t.date :final_date

      t.timestamps
    end
  end

  def self.down
    drop_table :platforms_markets
  end
end
