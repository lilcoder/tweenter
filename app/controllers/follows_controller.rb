class FollowsController < ApplicationController
	def create
		@user = User.find(params[:user_id])
		@follow = Follow.new(follow_params)
		@follow.leader = @user.id
		@follow.follower = current_user.id
		flash[:info] = "Now following #{@user.username}"
	end

	private
	def follow_params
		params.require(:follow).permit(:follower, :leader)
	end
end