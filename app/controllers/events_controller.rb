class EventsController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
  	@events = Event.all
  end

  def show
  end
end
