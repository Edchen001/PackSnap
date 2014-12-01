class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.string :name
      t.attachment :image
      t.belongs_to :user
      t.belongs_to :suggestable, polymorphic: true

      t.timestamps
    end
  end
end
