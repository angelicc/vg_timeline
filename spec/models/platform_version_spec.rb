require 'spec_helper'

describe PlatformVersion do
  before(:each) do
    @valid_attributes = {
      :platform_id => 1,
      :name => "value for name",
      :description => "value for description",
      :storage => "value for storage",
      :logo => "value for logo",
      :picture => "value for picture"
    }
  end

  it "should create a new instance given valid attributes" do
    PlatformVersion.create!(@valid_attributes)
  end
end
