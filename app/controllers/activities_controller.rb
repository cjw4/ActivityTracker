class ActivitiesController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		@activity = current_user.activities.build(activity_params)
		if @activity.save
			flash[:success] = "New activity has been created"
			redirect_to user_path(@user)
		else
			redirect_to user_path(@user)
		end
	end

  def edit
  end

  def show
  end

	def destroy
		@activity = current_user.activities.find(params[:id])
		@activity.destroy
		redirect_to user_path(current_user)
	end

	private

	def activity_params
		params.require(:activity).permit(:name, :units)
	end
end
