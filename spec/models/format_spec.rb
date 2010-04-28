require 'spec_helper'

describe Format do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :capacity => "value for capacity"
    }
  end

  it "should create a new instance given valid attributes" do
    Format.create!(@valid_attributes)
  end
end
