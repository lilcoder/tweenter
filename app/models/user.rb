class User < ActiveRecord::Base

	has_secure_password
	has_many :tweents

   has_many :follows
	has_many :followers, :through => :follows
   
   has_many :inverse_follows, :class_name => "Follow", :foreign_key => "follower_id"
   has_many :inverse_followers, :through => :inverse_follows, :source => :user
   
   
	validates :username, uniqueness: true
	validates :email, uniqueness: true

end
