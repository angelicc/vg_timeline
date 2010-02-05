class CreateDevelopers < ActiveRecord::Migration
  def self.up
    create_table :developers do |t|
      t.string :name, :null => false
      t.string :country
      t.date :founded
      t.integer :former_name_id
      t.integer :publisher_id

      t.timestamps
    end
  end

  def self.down
    drop_table :developers
  end
end
