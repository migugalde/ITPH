class AddBorderColorToEvents < ActiveRecord::Migration
  def change
    add_column :events, :borderColor, :string
  end
end
