class CreateTableGamesSpecs < ActiveRecord::Migration
  def self.up
    create_table :games_specs do |t|
      t.integer :game_id, :null => false
      t.integer :spec_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :games_specs
  end
end
