require 'spec_helper'

describe IndustryPerson do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :publisher_id => 1,
      :nationality => "value for nationality"
    }
  end

  it "should create a new instance given valid attributes" do
    IndustryPerson.create!(@valid_attributes)
  end
end
