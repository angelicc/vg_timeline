class CreateProjectLeaders < ActiveRecord::Migration
  def self.up
    create_table :project_leaders do |t|
      t.integer :game_id, :null => false
      t.integer :industry_person_id, :null => false
      t.string :position

      t.timestamps
    end
  end

  def self.down
    drop_table :project_leaders
  end
end
