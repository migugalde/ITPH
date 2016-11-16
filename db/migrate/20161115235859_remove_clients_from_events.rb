class RemoveClientsFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :client_id, :integer
  end
end
