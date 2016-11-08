class AddFieldsOthertoUsers < ActiveRecord::Migration
  def change
  	add_column :users, :phone_number, :string
  	add_column :users, :admin, :boolean
  end
end
