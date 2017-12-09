class UsersController < ApplicationController
	before_action :logged_in, only: [:edit, :show]
  before_action :correct_user, only: [:edit, :show]
		
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)	
		if @user.save
			flash[:success] = "You have successfully signed up."
			log_in(@user)
			redirect_to profile_path
		else
			render 'new'
		end
	end

  def edit
		@user = User.find_by(id: session[:user_id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to profile_path
		else
			render 'edit'
		end
	end

  def show
		@activities = current_user.activities
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def logged_in
		unless logged_in?
			flash[:danger] = "Please Log In"
			redirect_to login_path
		end
	end

	def correct_user
		@user = User.find_by(id: session[:user_id])
		unless current_user?(@user)
			redirect_to profile_path
			flash[:danger] = "You do not have access to that page!"
		end
	end
end
