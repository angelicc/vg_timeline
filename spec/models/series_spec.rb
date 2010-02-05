require 'spec_helper'

describe Series do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :spinoff_series_id => 1,
      :industry_person_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Series.create!(@valid_attributes)
  end
end
