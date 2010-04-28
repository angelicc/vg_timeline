class CreateVersions < ActiveRecord::Migration
  def self.up
    create_table :platform_versions do |t|
      t.integer :platform_id, :null => false
      t.string :name
      t.text :description
      t.string :storage
      t.string :logo
      t.string :picture

      t.timestamps
    end
  end

  def self.down
    drop_table :platform_versions
  end
end
