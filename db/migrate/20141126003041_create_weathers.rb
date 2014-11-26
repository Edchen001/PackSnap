class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.decimal :fahrenheit
      t.decimal :celsius
    end
  end
end
