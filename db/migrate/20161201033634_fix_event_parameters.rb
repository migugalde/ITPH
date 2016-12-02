class FixEventParameters < ActiveRecord::Migration
  def change
    add_column :events, :owned, :boolean, default: false
    remove_column :events, :borderColor, :string
    remove_column :events, :room_name, :string

  end
end
