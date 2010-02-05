class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :main_title, :null => false
      t.string :sub_title
      t.string :special_title
      t.text :description
      t.integer :series_id
      t.boolean :spinoff, :null => false, :default => false
      t.date :release_date
      t.integer :game_market_id
      t.integer :rating_id
      t.integer :game_press_id
      t.integer :platform_id, :null => false
      t.integer :game_platform_id
      t.string :boxart
      t.float :game_sales
      t.integer :game_award_id
      t.integer :sequel_id
      t.integer :prequel_id
      t.integer :local_players
      t.integer :online_players
      t.integer :local_multi_modes_id
      t.integer :online_multi_modes_id
      t.boolean :release_special_edition
      t.integer :re_release_id
      t.integer :remake_id
      t.integer :game_type_id, :null => false
      t.integer :game_include_peripheral_id
      t.integer :game_project_leader_id
      t.integer :game_composer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
