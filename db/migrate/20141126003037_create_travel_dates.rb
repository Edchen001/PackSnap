class CreateTravelDates < ActiveRecord::Migration
  def change
    create_table :travel_dates do |t|
      t.date :current_date , null: false
      t.references :itinerary, null: false
      t.references :weather, null: false

      t.timestamps
    end
  end
end
