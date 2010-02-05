require 'spec_helper'

describe Platform do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :publisher_id => 1,
      :description => "value for description",
      :generation => 1,
      :controller_ports => 1,
      :online_connectivity => false,
      :precursor_id => 1,
      :platform_market_id => 1,
      :overall_sales => 1.5,
      :logo => "value for logo",
      :picture => "value for picture",
      :addon_id => 1,
      :storage => "value for storage"
    }
  end

  it "should create a new instance given valid attributes" do
    Platform.create!(@valid_attributes)
  end
end
