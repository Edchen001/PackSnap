class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :user
      t.references :location
      t.attachment :image
    end
  end
end
