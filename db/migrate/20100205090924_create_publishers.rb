class CreatePublishers < ActiveRecord::Migration
  def self.up
    create_table :publishers do |t|
      t.string :name, :null => false
      t.string :country
      t.date :founded
      t.integer :former_name_id

      t.timestamps
    end
  end

  def self.down
    drop_table :publishers
  end
end
