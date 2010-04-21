class AddLogoToRatings < ActiveRecord::Migration
  def self.up
    add_column :ratings, :logo_filename, :string
  end

  def self.down
    remove_column :ratings, :logo_filename
  end
end
