require 'spec_helper'

describe Developer do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :country => "value for country",
      :founded => Date.today,
      :former_name_id => 1,
      :publisher_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Developer.create!(@valid_attributes)
  end
end
