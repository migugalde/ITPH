class AddCounselorToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :counselor_name, :string
  end
end
