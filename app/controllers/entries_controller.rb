class EntriesController < ApplicationController
	def new
		@activity = Activity.find(params[:activity_id])
		@entry = @activity.entries.build
	end
	def edit
		@activity = Activity.find(params[:activity_id])
		@entry = Entry.find(params[:id])
		respond_to do |f|
			f.html { redirect_to user_activity_path(current_user, @activity) }
			f.js
		end
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
	def update
		@activity = Activity.find(params[:activity_id])
		@entry = Entry.find(params[:id])
		@entry.update_attributes(entry_params)
		
		respond_to do |f|
			if @entry.save
				f.html {redirect_to user_activity_path(current_user, @activity)}
				f.js
			else
				f.html {render :new}
			end
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
