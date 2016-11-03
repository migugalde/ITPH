class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.references :user
      t.references :client
      t.string :type
      t.string :date
      t.string :room
      t.string :notes
      t.datetime :start
      t.datetime :end
      t.string :color
      t.timestamps
    end
  end
end
