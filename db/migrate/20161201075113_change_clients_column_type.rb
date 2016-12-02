class ChangeClientsColumnType < ActiveRecord::Migration
  def change
    change_column :clients, :form_updated_at, :string
    change_column :clients, :date_of_birth, :string
    change_column :clients, :date_of_last_physical_exam, :string
    change_column :clients, :spouses_dob, :string
  end
end