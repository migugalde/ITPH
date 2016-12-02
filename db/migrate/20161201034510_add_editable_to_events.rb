class AddEditableToEvents < ActiveRecord::Migration
  def change
    remove_column :events, :owned, :boolean
    add_column :events, :editable, :boolean, default: false

  end
end
