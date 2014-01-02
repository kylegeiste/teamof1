class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def show
	 	@user = User.find(params[:id])
	end

	def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the team, #{@user.first_name}!"
      redirect_to dashboard_url
  	else
      render 'new'
    end
  end

	def index
    #Put a comment here if this method is meant to be empty
	end

  private #Fixed Indentation
	#strong parameters, to prevent misuse
    def user_params
      params.require(:user).permit(:first_name, :last_name, :display_name, :email, :location, :password,
                                   :password_confirmation)

    #Consider the following syntax so you don't have to put the colon in front of all of those symbol names
    # *( %i(first_name last_name display_name email location password password confirmation) )
    end
end
