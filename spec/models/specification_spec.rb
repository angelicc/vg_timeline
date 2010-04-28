require 'spec_helper'

describe Specification do
  before(:each) do
    @valid_attributes = {
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Specification.create!(@valid_attributes)
  end
end
