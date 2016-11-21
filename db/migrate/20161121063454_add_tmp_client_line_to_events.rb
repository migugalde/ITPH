class AddTmpClientLineToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :new_name, :string
  	add_column :events, :new_email, :string
  end
end
