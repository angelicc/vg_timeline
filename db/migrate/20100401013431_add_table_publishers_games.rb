class AddTablePublishersGames < ActiveRecord::Migration
  def self.up
    create_table :games_publishers, :id => false do |t|
      t.integer :game_id
      t.integer :publisher_id
    end
  end

  def self.down
    drop_table :games_publishers
  end
end
