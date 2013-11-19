class SessionsController < ApplicationController
	def new
		
	end

	def create
	  user = User.find_by_email(params[:session][:email])
	  if user && user.authenticate(params[:session][:password])
	    session[:user_id] = user.id
	    flash[:info]="Logged in!"
	    redirect_to user_path(current_user)
	  else
	  	flash[:info]= "Email or password is invalid"
	    render "new"
	  end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, notice: "Logged out!"
	end

end