class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :counselor
      t.string :clients
      t.string :type
      t.string :date
      t.string :room
      t.string :notes
    end
  end
end
