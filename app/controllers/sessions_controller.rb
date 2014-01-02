class SessionsController < ApplicationController
  def new
    #Put a comment here if this method is supposed to be empty
  end

  #Fixed indentation in the create method
  def create
	  user = User.find_by(email: params[:session][:email].downcase) #No parameter sanitizing here?
	    if user && user.authenticate(params[:session][:password])
	      sign_in user
		    redirect_to dashboard_url
	    else
	      flash.now[:error] = 'Invalid email/password combination'
	      render 'new'
	    end
  end

  def destroy
    sign_out
    redirect_to signin_url
  end
end
