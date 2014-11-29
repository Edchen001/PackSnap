class ChangeLocationsToHaveAddress < ActiveRecord::Migration
  def up
    remove_column :locations, :name
    add_column :locations, :address, :string, null: false
  end
  def down
    add_column :locations, :name, :string
    remove_column :locations, :address
  end
end
