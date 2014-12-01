class RemoveAttachmentFromItems < ActiveRecord::Migration
  def up
    remove_attachment :items, :photo
  end
  def down
    add_attachment :items, :photo
  end
end
