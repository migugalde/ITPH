class ClientsController < ApplicationController

def client_params
	params.require(:client).permit(:name, :counselor, :email, :phone_number)
end

def show
	@client = Client.find(params[:id])
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
end

def update
	@client = Client.find params[:id]
	if @client.update(client_params)
		flash[:notice] = "Successfully added a new client!"
		redirect_to clients_path
	end
end
end