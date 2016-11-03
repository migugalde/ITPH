class EventsController < ApplicationController

def event_params
	params.require(:event).permit(:counselor, :client, :date, :time, :type, :room)
end

def new
    @event = Event.new
    user = User.find session[:user_id]
    @event.counselor = user.email
end

def create
    redirect_to home_path
end

end