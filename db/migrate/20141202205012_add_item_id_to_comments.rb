class AddItemIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :item_id, :integer
  end
end
