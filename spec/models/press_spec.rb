require 'spec_helper'

describe Press do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :url => "value for url",
      :region => "value for region",
      :market_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Press.create!(@valid_attributes)
  end
end
