require 'google_drive'

class ClientsController < ApplicationController

def client_params
	params.require(:client).permit(:name, :counselor, :email, :phone_number)
end

def show
	@client = Client.find(params[:id])
	drive = GoogleDrive::Session.from_config("config.json")
	@spreadsheet = drive.spreadsheet_by_key("1JCqPMgGr1UEHYwWtQp1c2E0HnuEHMJ68i2xSdDgYQw0").worksheets[0]
	@client_index = -1
	@spreadsheet.num_rows.downto(2) do |row|
		if @spreadsheet[row, 2] == @client.name
			@client_index = row
			break
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
end

def update
	@client = Client.find params[:id]
	if @client.update(client_params)
		flash[:notice] = "Successfully added a new client!"
		redirect_to clients_path
	end
end
end