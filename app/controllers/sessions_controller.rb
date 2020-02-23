class SessionsController < ApplicationController
  def new
  end

  def create
	  user = User.find_by(:email => params[:session][:email].downcase)
	  if user && user.valid_password?(params[:session][:password])
	    log_in user
	    flash[:success] = 'Successfully Signin.'
	    redirect_to root_path
		else
		  flash[:error] = 'Invalid email/password combination.'
	    redirect_to '/'
	  end
	end

  def destroy
    log_out
    redirect_to root_url
  end
end
