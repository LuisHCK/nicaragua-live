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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 201602121639210) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "icon",       limit: 255
  end

  create_table "clientprofiles", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "client_id",           limit: 4
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.string   "cover_file_name",     limit: 255
    t.string   "cover_content_type",  limit: 255
    t.integer  "cover_file_size",     limit: 4
    t.datetime "cover_updated_at"
    t.string   "city",                limit: 255
    t.string   "biography",           limit: 255
  end

  add_index "clientprofiles", ["client_id"], name: "index_clientprofiles_on_client_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "avatar_id",              limit: 4
    t.string   "name",                   limit: 255
  end

  add_index "clients", ["avatar_id"], name: "index_clients_on_avatar_id", using: :btree
  add_index "clients", ["email"], name: "index_clients_on_email", unique: true, using: :btree
  add_index "clients", ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true, using: :btree

  create_table "follows", force: :cascade do |t|
    t.integer  "profile_id",       limit: 4
    t.integer  "clientprofile_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "follows", ["clientprofile_id"], name: "index_follows_on_clientprofile_id", using: :btree
  add_index "follows", ["profile_id"], name: "index_follows_on_profile_id", using: :btree

  create_table "galleries", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "post_id",    limit: 4
  end

  add_index "galleries", ["post_id"], name: "index_galleries_on_post_id", using: :btree

  create_table "hearts", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "client_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "hearts", ["client_id"], name: "index_hearts_on_client_id", using: :btree
  add_index "hearts", ["post_id"], name: "index_hearts_on_post_id", using: :btree
  add_index "hearts", ["user_id"], name: "index_hearts_on_user_id", using: :btree

  create_table "master_admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "master_admins", ["email"], name: "index_master_admins_on_email", unique: true, using: :btree
  add_index "master_admins", ["reset_password_token"], name: "index_master_admins_on_reset_password_token", unique: true, using: :btree

  create_table "menus", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string   "titulo",             limit: 255
    t.string   "descripcion",        limit: 255
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.decimal  "precio",                         precision: 10
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.boolean  "cordoba"
    t.integer  "profile_id",         limit: 4
  end

  add_index "offers", ["profile_id"], name: "index_offers_on_profile_id", using: :btree

  create_table "panels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "post_id",            limit: 4
  end

  add_index "pictures", ["post_id"], name: "index_pictures_on_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "body",        limit: 65535
    t.integer  "likes",       limit: 4
    t.integer  "visit_count", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "profile_id",  limit: 4
  end

  add_index "posts", ["profile_id"], name: "index_posts_on_profile_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "cover_file_name",     limit: 255
    t.string   "cover_content_type",  limit: 255
    t.integer  "cover_file_size",     limit: 4
    t.datetime "cover_updated_at"
    t.text     "body",                limit: 65535
    t.string   "direccion",           limit: 255
    t.datetime "horario"
    t.string   "facebook",            limit: 255
    t.string   "twiter",              limit: 255
    t.string   "instagram",           limit: 255
    t.string   "youtube",             limit: 255
    t.string   "other",               limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "user_id",             limit: 4
    t.integer  "category_id",         limit: 4
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.integer  "followers",           limit: 4
    t.integer  "following",           limit: 4
  end

  add_index "profiles", ["category_id"], name: "index_profiles_on_category_id", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree
  add_index "profiles", ["user_id"], name: "user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "category_id",            limit: 4
    t.boolean  "has_section"
  end

  add_index "users", ["category_id"], name: "index_users_on_category_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wikis", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "body",               limit: 65535
    t.integer  "likes",              limit: 4
    t.integer  "visit_count",        limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "cover_file_name",    limit: 255
    t.string   "cover_content_type", limit: 255
    t.integer  "cover_file_size",    limit: 4
    t.datetime "cover_updated_at"
  end

  add_foreign_key "clientprofiles", "clients"
  add_foreign_key "offers", "profiles"
  add_foreign_key "pictures", "posts"
  add_foreign_key "posts", "profiles"
  add_foreign_key "profiles", "categories"
  add_foreign_key "profiles", "users"
end
