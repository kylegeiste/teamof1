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
      flash[:success] = "Welcome to the team #{@user.first_name}!"
      redirect_to @user
  	else
      render 'new'
    end
  end

	def index
	end

private
	#strong parameters, to prevent misuse
    def user_params
      params.require(:user).permit(:first_name, :last_name, :display_name, :email, :password,
                                   :password_confirmation)
    end
end
