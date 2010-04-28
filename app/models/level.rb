<<<<<<< HEAD
class Level < ActiveRecord::Base
  has_many :users
=======
# == Schema Information
# Schema version: 20100205060128
#
# Table name: levels
#
#  id             :integer(4)      not null, primary key
#  name           :string(100)     not null
#  new_games      :integer(4)      not null
#  modifications  :integer(4)      not null
#  delete_games   :boolean(1)      not null
#  add_categories :boolean(1)      not null
#  manage_users   :boolean(1)      not null
#  created_at     :datetime
#  updated_at     :datetime
#

class Level < ActiveRecord::Base
>>>>>>> 1a2077b7618653b1f5191387be40b27de1a3d757
end
