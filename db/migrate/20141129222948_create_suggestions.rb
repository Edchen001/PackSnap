class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
    	t.references :item
    	t.references :category
    end
  end
end
