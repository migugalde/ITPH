class AddEmailToCounselors < ActiveRecord::Migration
  def change
    add_column :counselors, :email, :string
  end
end
