class CreateReboxings < ActiveRecord::Migration
  def self.up
    create_table :reboxings do |t|
      t.integer :game_id, :null => false
      t.string :boxart_filename
      t.date :release_date

      t.timestamps
    end
  end

  def self.down
    drop_table :reboxings
  end
end
