class AddAttachmentBagToTrips < ActiveRecord::Migration
  def self.up
    change_table :trips do |t|
      t.attachment :bag
    end
  end

  def self.down
    remove_attachment :trips, :bag
  end
end
