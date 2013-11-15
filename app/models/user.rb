class User < ActiveRecord::Base

	has_secure_password
	has_many :tweents

	has_many :followers
	has_many :leaders

	validates :username, uniqueness: true
	validates :email, uniqueness: true

end
