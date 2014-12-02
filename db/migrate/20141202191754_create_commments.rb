class CreateCommments < ActiveRecord::Migration
  def change
    create_table :commments do |t|
    	t.text :content
    	t.references :users
    	t.references :locations 
    end
  end
end
