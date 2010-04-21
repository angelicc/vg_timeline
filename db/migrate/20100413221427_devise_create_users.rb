class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      t.string :username, :null => false
      t.integer :level_id, :null => false


      t.timestamps
    end

    add_index :users, :username,             :unique => true
    add_index :users, :email,                :unique => true
    add_index :users, :confirmation_token,   :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :users
  end
end
