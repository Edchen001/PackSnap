class UpdateLocationTable < ActiveRecord::Migration
  def up
  	remove_column :locations, :name, :string
  	add_column :locations, :address, :string, null: false
  	add_column :locations, :coordinate_id, :integer, null: false
  end

  def down
  	add_column :locations, :name, :string, null: false
  	remove_column :locations, :address, :string
  	remove_column :locations, :coordinate_id, :integer
  end
end
