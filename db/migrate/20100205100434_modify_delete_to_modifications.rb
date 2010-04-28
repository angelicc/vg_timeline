class ModifyDeleteToModifications < ActiveRecord::Migration
  def self.up
    rename_column :modifications, :delete, :remove
  end

  def self.down
  end
end
