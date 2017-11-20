class ActivitiesController < ApplicationController
	def new
		@activity = current_user.activities.build
	end

	def create
		@activity = current_user.activities.build(activity_params)
		if @activity.save
			flash[:success] = "New activity has been created"
			redirect_to user_path(current_user)
		else
			render 'new'
		end
	end

  def edit
  end

  def show
		@activity = current_user.activities.find(params[:id])
		@entries = @activity.entries
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