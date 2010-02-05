class CreateSpecs < ActiveRecord::Migration
  def self.up
    create_table :specs do |t|
      t.string :description, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :specs
  end
end
