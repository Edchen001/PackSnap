class CreateScopes < ActiveRecord::Migration
  def change
    create_table :scopes do |t|
    	t.float :minimum, null: false
    	t.float :maximum, null: false
    	t.references :category
    end
  end
end
