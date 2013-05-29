# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130529011324) do

  create_table "albums", :force => true do |t|
    t.string   "albumName",                :default => "Default Album"
    t.string   "description",              :default => "This is the Default Album"
    t.integer  "user_id"
    t.integer  "asset_id"
    t.string   "albumAvatar_file_name"
    t.string   "albumAvatar_content_type"
    t.integer  "albumAvatar_file_size"
    t.datetime "albumAvatar_updated_at"
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
  end

  add_index "albums", ["user_id", "asset_id"], :name => "index_albums_on_user_id_and_asset_id"

  create_table "assets", :force => true do |t|
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.integer  "user_id"
    t.integer  "album_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "assets", ["user_id", "album_id"], :name => "index_assets_on_user_id_and_album_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "isadmin"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

end
