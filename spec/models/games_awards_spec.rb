require 'spec_helper'

describe GamesAwards do
  before(:each) do
    @valid_attributes = {
      :game_id => 1,
      :press_id => 1,
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    GamesAwards.create!(@valid_attributes)
  end
end
