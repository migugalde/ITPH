class AddListClientsCounselorsForEvent < ActiveRecord::Migration
  def change
    add_column :events, :list_counselors, :string
    add_column :events, :list_clients, :string
  end
end
