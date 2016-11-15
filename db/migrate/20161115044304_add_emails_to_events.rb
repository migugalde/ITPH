class AddEmailsToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :client_email, :string
  end
end
