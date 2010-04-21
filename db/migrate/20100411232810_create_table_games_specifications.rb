class CreateTableGamesSpecifications < ActiveRecord::Migration
  def self.up
    create_table :games_specifications, :id => false do |t|
      t.integer :game_id
      t.integer :specification_id
    end
  end

  def self.down
    drop_table :games_specifications
  end
end
