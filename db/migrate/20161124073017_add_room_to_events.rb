class AddRoomToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :room, index: true, foreign_key: true
  end
end
