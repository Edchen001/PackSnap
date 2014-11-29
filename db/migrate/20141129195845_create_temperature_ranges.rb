class CreateTemperatureRanges < ActiveRecord::Migration
  def change
    create_table :temperature_ranges do |t|
    	t.float :minimum
    	t.float :maximum
    end
  end
end
