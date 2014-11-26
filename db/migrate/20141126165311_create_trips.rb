class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title, null: false
      t.string :description
    end
  end
end
