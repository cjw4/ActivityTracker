class UsersController < ApplicationController
  def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)	
		if @user.save
			flash[:success] = "You have successfully signed up."
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
end
