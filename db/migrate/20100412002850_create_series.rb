class CreateSeries < ActiveRecord::Migration
  def self.up
    create_table :series do |t|
      t.string :name, :null => false
      t.integer :main_series_id
      t.integer :industry_person_id

      t.timestamps
    end
  end

  def self.down
    drop_table :series
  end
end
