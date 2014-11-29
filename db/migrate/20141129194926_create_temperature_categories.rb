class CreateTemperatureCategories < ActiveRecord::Migration
  def change
    create_table :temperature_categories do |t|
    	t.string :type, null: false
    	t.references :range
    	t.references :item, null:false
    end
  end
end
