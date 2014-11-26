class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end
  end
end
