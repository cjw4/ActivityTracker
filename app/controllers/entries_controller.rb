class EntriesController < ApplicationController
	def new
		@activity = Activity.find(params[:activity_id])
		@entry = @activity.entries.build
	end
	def create
		@activity = Activity.find(params[:activity_id])
		@entry = @activity.entries.build(entry_params)
		if @entry.save
			redirect_to activity_path(@activity) 
		else
			render 'new'
		end
	end
	def destroy
		@entry = Entry.find(params[:id]) 
		@entry.destroy
		redirect_to activity_path(Activity.find(params[:activity_id]))
	end
	private

	def entry_params
		params.require(:entry).permit(:date, :activity_id, :units)
	end
end
