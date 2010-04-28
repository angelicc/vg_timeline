require 'spec_helper'

describe Rating do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description",
      :market_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Rating.create!(@valid_attributes)
  end
end
