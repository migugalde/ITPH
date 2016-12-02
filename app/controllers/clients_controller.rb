require 'google_drive'

class ClientsController < ApplicationController

def client_params
	params.require(:client).permit(:name, :counselor, :email, :phone_number)
end

def show
	@client = Client.find(params[:id])
	@client.update_variables(current_user)
	events = Event.all
	@client_events = []
	events.each do |e|
		if e.clients.include?(@client)
			@client_events << e
		end
	end
end

def index
	@clients = Client.all
end

def new
	@client = Client.new
end

def edit
	@client = Client.find params[:id]
end

def create
	@client.users << current_user
end

def update
	@client = Client.find params[:id]
	if @client.update(client_params)
		flash[:notice] = "Successfully added a new client!"
		redirect_to clients_path
	end
end

end
