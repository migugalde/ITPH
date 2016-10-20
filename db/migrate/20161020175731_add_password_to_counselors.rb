class AddPasswordToCounselors < ActiveRecord::Migration
  def change
    add_column :counselors, :password, :string
  end
end
