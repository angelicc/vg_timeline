class CreateMultiplayerModes < ActiveRecord::Migration
  def self.up
    create_table :multiplayer_modes do |t|
      t.boolean :coop, :null => false, :default => false
      t.boolean :vs, :null => false, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :multiplayer_modes
  end
end
