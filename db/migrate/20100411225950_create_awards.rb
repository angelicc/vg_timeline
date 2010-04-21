class CreateAwards < ActiveRecord::Migration
  def self.up
    create_table :awards do |t|
      t.integer :game_id, :null => false
      t.integer :press_id, :null => false
      t.string :description, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :awards
  end
end
