class	TweentsController < ApplicationController
	def create
	 @user = User.find(params[:user_id])
	 @tweent = @user.tweents.new(tweent_params)

	    if @tweent.save
	      redirect_to :back
	    else
	      render "new"
	    end
  	end

	private
	def tweent_params
		params.require(:tweent).permit(:user_id, :body)
	end

end	