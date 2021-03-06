class UsersController < ApplicationController

	def index
		
	end

	def show
		@user = User.find(params[:id])
		@follow = Follow.new
	end


	def new
		@user = User.new
	end

	def create
	    @user = User.new(user_params)
	    if @user.save
	      session[:user_id] = @user.id
	      redirect_to user_path(@user)
	    else
	      render "new"
	    end
  	end

	private
	def user_params
		params.require(:user).permit(:username, 
			:password, :password_confirmation, :year_born, :email, :bio)
	end
end