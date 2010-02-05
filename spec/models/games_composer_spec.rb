require 'spec_helper'

describe GamesComposer do
  before(:each) do
    @valid_attributes = {
      :game_id => 1,
      :industry_person_id => 1,
      :position => "value for position"
    }
  end

  it "should create a new instance given valid attributes" do
    GamesComposer.create!(@valid_attributes)
  end
end
