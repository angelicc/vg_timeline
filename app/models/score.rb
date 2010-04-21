class Score < ActiveRecord::Base
  belongs_to :press
  belongs_to :games
end
