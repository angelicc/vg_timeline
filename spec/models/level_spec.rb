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
