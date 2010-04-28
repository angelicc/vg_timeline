require 'spec_helper'

describe Modification do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :description => "value for description",
      :remove => false,
      :new => false,
      :modified => false,
      :table_id => 1,
      :modified_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Modification.create!(@valid_attributes)
  end
end
