require 'spec_helper'

describe GamesPress do
  before(:each) do
    @valid_attributes = {
      :game_id => 1,
      :press_id => 1,
      :score => "value for score",
      :review_link => "value for review_link"
    }
  end

  it "should create a new instance given valid attributes" do
    GamesPress.create!(@valid_attributes)
  end
end
