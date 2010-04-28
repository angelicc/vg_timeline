class RenameTables < ActiveRecord::Migration
  def self.up
    rename_table :game_composers, :games_composers
    rename_table :game_project_leaders, :games_project_leaders
    rename_table :game_include_peripherals, :games_include_peripherals
    rename_table :game_reboxings, :games_reboxings
  end

  def self.down
  end
end
