class User < ActiveRecord::Base
<<<<<<< HEAD
  is_gravtastic!
  belongs_to :level
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :username

  #has_attached_file :avatar, :url => "/images/avatars/:style/:avatar_name", :styles => { :thumb => "120x120>", :mini => "50x50>" }, :path => ":rails_root/public/images/avatars/:style/:avatar_name"
=======
>>>>>>> 1a2077b7618653b1f5191387be40b27de1a3d757
end
