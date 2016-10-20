class ClientsController < ApplicationController

def client_params
	params.require(:client).permit(:name, :counselor, :email, :phone_number)
end

def show
	@client = Client.find(params[:id])
end

def index
	#render :partial => "/clients/index"
	@clients = Client.all
end

def new
	@client = Client.new
end

def edit
	@client = Client.find params[:id]
end

def create
	@client = Client.create!(client_params)
	flash[:notice] = "#{@client.name} was successfully created."
	redirect_to clients_path
end

def destroy
	@client = Client.find(params[:id])
	@client.destroy
	flash[:notice] = "Client '#{@client.name}' deleted."
	redirect_to clients_path
end

def update
	@client = Client.find params[:id]
	if @client.update(client_params)
		flash[:notice] = "Successfully added a new client!"
		redirect_to clients_path
	else
		flash[:error] = "Error. Not Valid"
		render "edit"
	end
end
end