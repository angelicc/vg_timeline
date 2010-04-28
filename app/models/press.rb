class Press < ActiveRecord::Base
<<<<<<< HEAD
  has_many :sores
  has_many :games, :through => :scores

  validates_presence_of :name
=======
>>>>>>> 1a2077b7618653b1f5191387be40b27de1a3d757
end
