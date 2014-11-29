class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions_s do |t|
    	t.references :item
    	t.references :temperature_category
    end
  end
end
