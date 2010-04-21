class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :scores do |t|
      t.string :score
      t.string :url
      t.integer :press_id, :null => false
      t.integer :game_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :scores
  end
end
