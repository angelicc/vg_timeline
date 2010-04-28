class ModifySpecs < ActiveRecord::Migration
  def self.up
    rename_table :specs, :specifications
    rename_column :games_specs, :spec_id, :specification_id
    rename_table :games_specs, :games_specifications
  end

  def self.down
  end
end
