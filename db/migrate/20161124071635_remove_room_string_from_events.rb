class RemoveRoomStringFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :room, :string
  end
end
