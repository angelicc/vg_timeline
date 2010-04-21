class AddShortNameToPlatforms < ActiveRecord::Migration
  def self.up
    add_column :platforms, :short_name, :string, :null => false
  end

  def self.down
    remove_column :platforms, :short_name
  end
end
