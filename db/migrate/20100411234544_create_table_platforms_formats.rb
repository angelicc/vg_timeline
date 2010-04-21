class CreateTablePlatformsFormats < ActiveRecord::Migration
  def self.up
    create_table :formats_platforms, :id => false do |t|
      t.integer :format_id
      t.integer :platform_id
    end
  end

  def self.down
    drop_table :formats_platforms
  end
end
