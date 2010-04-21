class AddColumnsToDevelopers < ActiveRecord::Migration
  def self.up
    add_column :developers, :country, :string
    add_column :developers, :founded, :date
    add_column :developers, :former_name_id, :integer
    add_column :developers, :publisher_id, :integer
  end

  def self.down
    remove_column :developers, :publisher_id
    remove_column :developers, :former_name_id
    remove_column :developers, :founded
    remove_column :developers, :country
  end
end
