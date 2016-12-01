class RemoveColorFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :color, :string
  end
end
