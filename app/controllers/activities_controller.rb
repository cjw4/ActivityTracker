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
		@activity = Activity.find(params[:id])
	end

	def update
		@activity = Activity.find(params[:id]) 
		@activity.update_attributes(activity_params)
		redirect_to current_user
	end

  def show
		@activity = current_user.activities.find(params[:id])
		@entries = @activity.entries.sort_by(&:date).reverse
		@plot_data = Array.new
		@entries.each { |entry| @plot_data.push([entry.date.to_formatted_s(:db),entry.units]) }

		respond_to do |format|
			format.html
			format.csv { send_data @entries.to_csv }
		end
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
