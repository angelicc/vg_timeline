class CreateTableGamesComposers < ActiveRecord::Migration
  def self.up
    create_table :composers_games, :id => false do |t|
      t.integer :industry_person_id
      t.integer :game_id
    end
  end

  def self.down
    drop_table :composers_games
  end
end
