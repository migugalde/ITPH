class AddClientNameToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :client_name, :string
  end
end
