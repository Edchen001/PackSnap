class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.string :name, null: false
      t.text :description
      t.attachment :image
      t.belongs_to :user
      t.belongs_to :location

      t.timestamps
    end
  end
end
