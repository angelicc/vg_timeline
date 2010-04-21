class CreateIndustryPeople < ActiveRecord::Migration
  def self.up
    create_table :industry_people do |t|
      t.string :name, :null => false
      t.integer :publisher_id
      t.string :nationality

      t.timestamps
    end
  end

  def self.down
    drop_table :industry_people
  end
end
