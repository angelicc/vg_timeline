require 'spec_helper'

describe Game do
  before(:each) do
    @valid_attributes = {
      :main_title => "value for main_title",
      :sub_title => "value for sub_title",
      :special_title => "value for special_title",
      :description => "value for description",
      :series_id => 1,
      :spinoff => false,
      :release_date => Date.today,
      :game_market_id => 1,
      :rating_id => 1,
      :game_press_id => 1,
      :platform_id => 1,
      :game_platform_id => 1,
      :boxart => "value for boxart",
      :game_sales => 1.5,
      :game_award_id => 1,
      :sequel_id => 1,
      :prequel_id => 1,
      :local_players => 1,
      :online_players => 1,
      :local_multi_modes_id => 1,
      :online_multi_modes_id => 1,
      :release_special_edition => false,
      :re_release_id => 1,
      :remake_id => 1,
      :game_type_id => 1,
      :game_include_peripheral_id => 1,
      :game_project_leader_id => 1,
      :game_composer_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Game.create!(@valid_attributes)
  end
end
