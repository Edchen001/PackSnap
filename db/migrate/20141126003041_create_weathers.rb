class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.float :fahrenheit
      t.float :celsius
      t.references :travel_date
    end
  end
end
