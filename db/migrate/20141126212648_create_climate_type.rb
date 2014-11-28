class CreateClimateType < ActiveRecord::Migration
  def change
    create_table :climate_types do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.text :description, null: false
    end
  end
end
