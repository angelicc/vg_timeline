require 'spec_helper'

describe GamesMarkets do
  before(:each) do
    @valid_attributes = {
      :game_id => 1,
      :market_id => 1,
      :market_sales => 1.5
    }
  end

  it "should create a new instance given valid attributes" do
    GamesMarkets.create!(@valid_attributes)
  end
end
