require 'spec_helper'

describe GamesIncludePeripheral do
  before(:each) do
    @valid_attributes = {
      :game_id => 1,
      :peripheral_id => 1,
      :quantity => 1
    }
  end

  it "should create a new instance given valid attributes" do
    GamesIncludePeripheral.create!(@valid_attributes)
  end
end
