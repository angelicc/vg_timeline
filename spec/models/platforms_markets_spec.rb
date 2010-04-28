require 'spec_helper'

describe PlatformsMarkets do
  before(:each) do
    @valid_attributes = {
      :platform_id => 1,
      :market_id => 1,
      :market_sales => 1.5,
      :release_date => Date.today,
      :final_date => Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    PlatformsMarkets.create!(@valid_attributes)
  end
end
