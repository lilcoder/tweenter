class FollowsController < ApplicationController
	def create
		@user = User.find(params[:user_id])
		@follow = Follow.new(follow_params)
		@follow.user = @user
		@follow.follower = current_user
      
      if @follow.save
         flash[:info] = "#{@follow.follower.username} is now following #{@follow.user.username}"
         redirect_to :back
      else
         flash[:info] = "Error"
         redirect_to :back
      end
	end

	private
	def follow_params
		params.require(:follow).permit(:follower_id, :leader_id)
	end
end