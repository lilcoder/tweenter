class Follow < ActiveRecord::Base

	belongs_to :user
	belongs_to :follower,  foreign_key: "follower_id", class_name: "User"

   validates_uniqueness_of :follower_id, :scope => [:user_id]

end
