class AddNamesToCounselors < ActiveRecord::Migration
  def change
    add_column :counselors, :name, :string
  end
end
