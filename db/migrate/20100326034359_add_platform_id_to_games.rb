class AddPlatformIdToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :platform_id, :int, :null => false
  end

  def self.down
    remove_column :games, :platform_id
  end
end
