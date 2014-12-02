class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
    	t.belongs_to :category
    	t.belongs_to :item

   		t.timestamps
    end
  end
end
