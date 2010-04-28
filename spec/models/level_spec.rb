# == Schema Information
# Schema version: 20100205060128
#
# Table name: levels
#
#  id             :integer(4)      not null, primary key
#  name           :string(100)     not null
#  new_games      :integer(4)      not null
#  modifications  :integer(4)      not null
#  delete_games   :boolean(1)      not null
#  add_categories :boolean(1)      not null
#  manage_users   :boolean(1)      not null
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe Level do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :new_games => 1,
      :modifications => 1,
      :delete_games => true,
      :add_categories => true,
      :manage_users => true
    }
  end

  it "should create a new instance given valid attributes" do
    Level.create!(@valid_attributes)
  end
end
