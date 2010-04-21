class CreateTableGamesTypes < ActiveRecord::Migration
  def self.up
    create_table :games_types, :id => false do |t|
      t.integer :game_id
      t.integer :type_id
    end
  end

  def self.down
    drop_table :games_types
  end
end
