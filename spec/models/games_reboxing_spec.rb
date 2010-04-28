require 'spec_helper'

describe GamesReboxing do
  before(:each) do
    @valid_attributes = {
      :game_id => 1,
      :boxart => "value for boxart",
      :release_date => Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    GamesReboxing.create!(@valid_attributes)
  end
end
