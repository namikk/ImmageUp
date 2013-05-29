class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.attachment :asset
      t.integer :user_id
      t.integer :album_id
      t.timestamps
    end
    add_index :assets, [:user_id, :album_id]
  end
end
