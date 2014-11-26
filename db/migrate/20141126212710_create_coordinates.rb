class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.references :climate_type, null: false
      t.float :longitude, null: false
      t.float :latitude, null: false
    end
  end
end
