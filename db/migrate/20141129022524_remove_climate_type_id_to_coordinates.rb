class RemoveClimateTypeIdToCoordinates < ActiveRecord::Migration
  def change
  	remove_column :coordinates, :climate_type_id, :integer
  end
end
