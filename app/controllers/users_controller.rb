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
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

  def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to user_path(@user)
		else
			render 'edit'
		end
	end

  def show
		@user = User.find(params[:id])
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
		@user = User.find(params[:id])
		unless current_user?(@user)
			redirect_to user_path(current_user)
			flash[:danger] = "You do not have access to that page!"
		end
	end
end
