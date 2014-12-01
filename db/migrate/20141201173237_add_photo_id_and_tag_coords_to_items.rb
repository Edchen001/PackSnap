class AddPhotoIdAndTagCoordsToItems < ActiveRecord::Migration
  def up
    add_column :items, :photo_id, :integer
    add_column :items, :tagX, :float
    add_column :items, :tagY, :float
  end
  def down
    remove_column :items, :photo_id
    remove_column :items, :tagX
    remove_column :items, :tagY
  end
end
