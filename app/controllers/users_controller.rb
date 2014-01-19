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
    @users = User.all
    @users_sorted = @users.sort_by{|user| user.id}
	end

private
	#strong parameters, to prevent misuse
    def user_params
      params.require(:user).permit(:first_name, :last_name, :display_name, :email, :location, :password,
                                   :password_confirmation)
    end
end
