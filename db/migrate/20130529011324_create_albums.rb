class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :albumName, :default => 'Default Album'
      t.string :description, :default => 'This is the Default Album'
      t.integer :user_id
      t.integer :asset_id
      t.attachment :albumAvatar
      t.timestamps
    end
    add_index :albums, [:user_id, :asset_id]
  end
end
