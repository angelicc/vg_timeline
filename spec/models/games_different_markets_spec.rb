require 'spec_helper'

describe GamesDifferentMarkets do
  before(:each) do
    @valid_attributes = {
      :game_id => 1,
      :diff_market_game_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    GamesDifferentMarkets.create!(@valid_attributes)
  end
end
