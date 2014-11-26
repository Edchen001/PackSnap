class CreateDates < ActiveRecord::Migration
  def change
    create_table :dates do |t|
      t.date :current_date , null: false
      t.references :destination, null: false
      t.references :weather, null: false

      t.timestamps
    end
  end
end
