class Press < ActiveRecord::Base
  has_many :sores
  has_many :games, :through => :scores

  validates_presence_of :name
end
