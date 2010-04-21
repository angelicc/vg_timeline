class CreateSpecifications < ActiveRecord::Migration
  def self.up
    create_table :specifications do |t|
      t.string :description, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :specifications
  end
end
