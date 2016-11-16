class CreateJoinTableClientEvent < ActiveRecord::Migration
  def change
    create_join_table :clients, :events do |t|
      # t.index [:client_id, :event_id]
      # t.index [:event_id, :client_id]
    end
  end
end
