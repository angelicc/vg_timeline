require 'spec_helper'

describe GamesPlatforms do
  before(:each) do
    @valid_attributes = {
      :game_id => 1,
      :platform_id => 1,
      :platform_sales => 1.5
    }
  end

  it "should create a new instance given valid attributes" do
    GamesPlatforms.create!(@valid_attributes)
  end
end
