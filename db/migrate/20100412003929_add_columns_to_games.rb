class AddColumnsToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :special_title, :string
    add_column :games, :description, :text
    add_column :games, :series_id, :integer
    add_column :games, :spinoff, :boolean, :default => false, :null => false
    add_column :games, :market_id, :integer
    add_column :games, :rating_id, :integer
    add_column :games, :sales, :float
    add_column :games, :sequel_id, :integer
    add_column :games, :prequel_id, :integer
    add_column :games, :local_players, :integer
    add_column :games, :online_players, :integer
    add_column :games, :local_multi_modes_id, :integer
    add_column :games, :online_multi_modes_id, :integer
    add_column :games, :release_special_edition, :boolean, :default => false, :null => false
    add_column :games, :re_release_id, :integer
    add_column :games, :remake_id, :integer
  end

  def self.down
    remove_column :games, :remake_id
    remove_column :games, :re_release_id
    remove_column :games, :release_special_edition
    remove_column :games, :online_multi_modes_id
    remove_column :games, :local_multi_modes_id
    remove_column :games, :online_players
    remove_column :games, :local_players
    remove_column :games, :prequel_id
    remove_column :games, :sequel_id
    remove_column :games, :sales
    remove_column :games, :rating_id
    remove_column :games, :market_id
    remove_column :games, :spinoff
    remove_column :games, :series_id
    remove_column :games, :description
    remove_column :games, :special_title
  end
end
