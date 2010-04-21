class CreateFormats < ActiveRecord::Migration
  def self.up
    create_table :formats do |t|
      t.string :name, :null => false
      t.string :capacity

      t.timestamps
    end
  end

  def self.down
    drop_table :formats
  end
end
