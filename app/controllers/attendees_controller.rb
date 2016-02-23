class AttendeesController < ApplicationController
	def create
		Attendee.create(event_id: params[:event_id], user_id: params[:user_id])
		redirect_to '/events'
	end

	def destroy
		Attendee.where(:user_id => params[:user_id], :event_id => params[:event_id]).destroy_all
		redirect_to '/events'
	end
	
end
