class AddColumnsToPlatforms < ActiveRecord::Migration
  def self.up
    add_column :platforms, :publisher_id, :integer
    add_column :platforms, :description, :text
    add_column :platforms, :generation, :integer
    add_column :platforms, :controller_ports, :integer
    add_column :platforms, :online_connectivity, :boolean, :default => false, :null => false
    add_column :platforms, :precursor_id, :integer
    add_column :platforms, :market_id, :integer
    add_column :platforms, :sales, :float
    add_column :platforms, :logo_filename, :string
    add_column :platforms, :picture_filename, :string
    add_column :platforms, :addon_id, :integer
    add_column :platforms, :storage, :string
  end

  def self.down
    remove_column :platforms, :storage
    remove_column :platforms, :addon_id
    remove_column :platforms, :picture_filename
    remove_column :platforms, :logo_filename
    remove_column :platforms, :sales
    remove_column :platforms, :market_id
    remove_column :platforms, :precursor_id
    remove_column :platforms, :online_connectivity
    remove_column :platforms, :controller_ports
    remove_column :platforms, :generation
    remove_column :platforms, :description
    remove_column :platforms, :publisher_id
  end
end
