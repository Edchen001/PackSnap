class CreateScopes < ActiveRecord::Migration
  def change
    create_table :scopes do |t|
    	t.float :minimum
    	t.float :maximum
    	t.references :category
    end
  end
end
