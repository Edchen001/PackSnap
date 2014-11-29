class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions_s do |t|
    	t.references :item, null: false
    	t.references :temperature_category, null: false
    end
  end
end
