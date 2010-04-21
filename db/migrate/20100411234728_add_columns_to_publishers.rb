class AddColumnsToPublishers < ActiveRecord::Migration
  def self.up
    add_column :publishers, :country, :string
    add_column :publishers, :founded, :date
    add_column :publishers, :former_name_id, :integer
  end

  def self.down
    remove_column :publishers, :former_name_id
    remove_column :publishers, :founded
    remove_column :publishers, :country
  end
end
