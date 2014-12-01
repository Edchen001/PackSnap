class AddPhotoIdAndTagCoordsToItems < ActiveRecord::Migration
  def up
    add_column :items, :photo_id, :integer
    add_column :items, :tag_x, :float
    add_column :items, :tag_y, :float
  end
  def down
    remove_column :items, :photo_id
    remove_column :items, :tag_x
    remove_column :items, :tag_y
  end
end
