class CreateTablePlatformsFormats < ActiveRecord::Migration
  def self.up
    create_table :platforms_formats do |t|
      t.integer :platform_id, :null => false
      t.integer :format_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :platforms_formats
  end
end
