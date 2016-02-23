class EventsController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
  	@events = Event.all
  end

  def create
  	# fail
  	# render json: params
  	event = Event.new(event_params)
  	if event.valid?
  		event.save
  		flash[:event_status] = "Event Created Successfully"
  		redirect_to '/events'
  	else
  		flash[:event_status] = event.errors.full_messages
  		redirect_to '/events'
  	end
  end

  def show
  	@event = Event.find(params[:id])
  end
  def destroy
  	Event.find(params[:event_id]).destroy
  	redirect_to '/events'
  end

  def event_params
  	params.require(:event).permit(:name, :date, :location, :state, :user_id)
  end
end
