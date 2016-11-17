class RemoveExtraTables < ActiveRecord::Migration
  def change
  	drop_table :fullcalendar_engine_event_series
    	remove_column :events, :counselor, :string
	remove_column :events, :clients, :string
  end
end
