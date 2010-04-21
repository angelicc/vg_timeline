class AddColumnsToPress < ActiveRecord::Migration
  def self.up
    add_column :press, :region, :string
    add_column :press, :market_id, :integer
  end

  def self.down
    remove_column :press, :market_id
    remove_column :press, :region
  end
end
