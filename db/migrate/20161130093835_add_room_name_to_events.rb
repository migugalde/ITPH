class AddRoomNameToEvents < ActiveRecord::Migration
  def change
    add_column :events, :room_name, :string
  end
end
