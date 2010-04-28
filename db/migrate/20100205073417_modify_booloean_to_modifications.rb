class ModifyBooloeanToModifications < ActiveRecord::Migration
  def self.up
    change_column :modifications, :delete, :boolean, :default => false, :null => false
    change_column :modifications, :new, :boolean, :default => false, :null => false
    change_column :modifications, :modified, :boolean, :default => false, :null => false
  end

  def self.down
  end
end
