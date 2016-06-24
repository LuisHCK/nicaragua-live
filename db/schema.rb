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

ActiveRecord::Schema.define(version: 201606222219123) do

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id",      limit: 4
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 191
    t.float    "avg",           limit: 24,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "icon",       limit: 255
  end

  create_table "cinemas", force: :cascade do |t|
    t.string   "name",       limit: 191
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "clientprofiles", force: :cascade do |t|
    t.string   "name",                limit: 191
    t.string   "ubication",           limit: 191
    t.text     "biography",           limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "cover_file_name",     limit: 191
    t.string   "cover_content_type",  limit: 191
    t.integer  "cover_file_size",     limit: 4
    t.datetime "cover_updated_at"
    t.string   "avatar_file_name",    limit: 191
    t.string   "avatar_content_type", limit: 191
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.integer  "client_id",           limit: 4
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

  create_table "comments", force: :cascade do |t|
    t.text     "body",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "post_id",    limit: 4
    t.integer  "client_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "event_id",   limit: 4
  end

  add_index "comments", ["client_id"], name: "index_comments_on_client_id", using: :btree
  add_index "comments", ["event_id"], name: "index_comments_on_event_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "coupon_redemptions", force: :cascade do |t|
    t.integer  "coupon_id",   limit: 4,                      null: false
    t.integer  "client_id",   limit: 4
    t.string   "unique_code", limit: 191
    t.string   "state",       limit: 191, default: "active", null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "coupon_redemptions", ["client_id"], name: "index_coupon_redemptions_on_client_id", using: :btree
  add_index "coupon_redemptions", ["unique_code"], name: "unique_code", unique: true, using: :btree

  create_table "coupons", force: :cascade do |t|
    t.string   "code",                     limit: 191,                    null: false
    t.string   "description",              limit: 191
    t.date     "valid_from",                                              null: false
    t.date     "valid_until"
    t.integer  "redemption_limit",         limit: 4,   default: 1,        null: false
    t.integer  "coupon_redemptions_count", limit: 4,   default: 0,        null: false
    t.integer  "amount",                   limit: 4,   default: 0,        null: false
    t.string   "type",                     limit: 191
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.string   "state",                    limit: 120, default: "active"
    t.integer  "user_id",                  limit: 4
  end

  add_index "coupons", ["user_id"], name: "index_coupons_on_user_id", using: :btree

  create_table "event_comments", force: :cascade do |t|
    t.text     "body",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "event_id",   limit: 4
    t.integer  "client_id",  limit: 4
    t.integer  "user_id",    limit: 4
  end

  add_index "event_comments", ["client_id"], name: "index_event_comments_on_client_id", using: :btree
  add_index "event_comments", ["event_id"], name: "index_event_comments_on_event_id", using: :btree
  add_index "event_comments", ["user_id"], name: "index_event_comments_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title",              limit: 191
    t.date     "date"
    t.time     "time"
    t.text     "description",        limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id",            limit: 4
    t.string   "cover_file_name",    limit: 191
    t.string   "cover_content_type", limit: 191
    t.integer  "cover_file_size",    limit: 4
    t.datetime "cover_updated_at"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "follows", force: :cascade do |t|
    t.integer  "profile_id", limit: 4
    t.integer  "client_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "follows", ["client_id"], name: "index_follows_on_client_id", using: :btree
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
  add_index "hearts", ["post_id"], name: "post_id", using: :btree
  add_index "hearts", ["user_id"], name: "index_hearts_on_user_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "titulo",      limit: 191
    t.text     "descripcion", limit: 65535
    t.decimal  "precio",                    precision: 10
    t.string   "ubicacion",   limit: 191
    t.string   "estado",      limit: 191
    t.integer  "valoracion",  limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "client_id",   limit: 4
    t.string   "moneda",      limit: 191
    t.string   "telefono",    limit: 191
    t.string   "email",       limit: 191
    t.string   "nombre",      limit: 191
    t.integer  "market_id",   limit: 4
  end

  add_index "items", ["client_id"], name: "index_items_on_client_id", using: :btree
  add_index "items", ["market_id"], name: "index_items_on_market_id", using: :btree

  create_table "markets", force: :cascade do |t|
    t.string   "title",       limit: 191
    t.string   "description", limit: 191
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "icon",        limit: 191
  end

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

  create_table "movies", force: :cascade do |t|
    t.string   "title",               limit: 191
    t.string   "original_title",      limit: 191
    t.string   "country",             limit: 191
    t.string   "production",          limit: 191
    t.string   "script",              limit: 191
    t.text     "allocation",          limit: 65535
    t.string   "clasification",       limit: 191
    t.text     "sinopsis",            limit: 65535
    t.string   "lang",                limit: 191
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "user_id",             limit: 4
    t.string   "cover_file_name",     limit: 191
    t.string   "cover_content_type",  limit: 191
    t.integer  "cover_file_size",     limit: 4
    t.datetime "cover_updated_at"
    t.string   "banner_file_name",    limit: 191
    t.string   "banner_content_type", limit: 191
    t.integer  "banner_file_size",    limit: 4
    t.datetime "banner_updated_at"
  end

  add_index "movies", ["user_id"], name: "index_movies_on_user_id", using: :btree

  create_table "offers", force: :cascade do |t|
    t.string   "titulo",             limit: 255
    t.text     "descripcion",        limit: 65535
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.decimal  "precio",                           precision: 10
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.boolean  "cordoba"
    t.integer  "profile_id",         limit: 4
  end

  add_index "offers", ["profile_id"], name: "index_offers_on_profile_id", using: :btree

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 191
    t.float    "overall_avg",   limit: 24,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.integer  "item_id",            limit: 4
  end

  add_index "pictures", ["item_id"], name: "index_pictures_on_item_id", using: :btree
  add_index "pictures", ["post_id"], name: "index_pictures_on_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "body",        limit: 65535
    t.integer  "likes",       limit: 4
    t.integer  "visit_count", limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "profile_id",  limit: 4
    t.string   "video",       limit: 191
    t.boolean  "trending",                  default: false
  end

  add_index "posts", ["profile_id"], name: "index_posts_on_profile_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "offer_section_name",  limit: 120,   default: "Oferta", null: false
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
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.integer  "user_id",             limit: 4
    t.integer  "category_id",         limit: 4
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "profiles", ["category_id"], name: "index_profiles_on_category_id", using: :btree
  add_index "profiles", ["user_id", "category_id"], name: "user_id_2", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree
  add_index "profiles", ["user_id"], name: "user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating",     limit: 4
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "client_id",  limit: 4
    t.integer  "profile_id", limit: 4
  end

  add_index "reviews", ["client_id"], name: "index_reviews_on_client_id", using: :btree
  add_index "reviews", ["profile_id"], name: "index_reviews_on_profile_id", using: :btree

  create_table "survey_answers", force: :cascade do |t|
    t.integer  "attempt_id",  limit: 4
    t.integer  "question_id", limit: 4
    t.integer  "option_id",   limit: 4
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_attempts", force: :cascade do |t|
    t.integer "participant_id",   limit: 4
    t.string  "participant_type", limit: 191
    t.integer "survey_id",        limit: 4
    t.boolean "winner"
    t.integer "score",            limit: 4
  end

  create_table "survey_options", force: :cascade do |t|
    t.integer  "question_id", limit: 4
    t.integer  "weight",      limit: 4,   default: 0
    t.string   "text",        limit: 191
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_questions", force: :cascade do |t|
    t.integer  "survey_id",  limit: 4
    t.string   "text",       limit: 191
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_surveys", force: :cascade do |t|
    t.string   "name",            limit: 191
    t.text     "description",     limit: 65535
    t.integer  "attempts_number", limit: 4,     default: 0
    t.boolean  "finished",                      default: false
    t.boolean  "active",                        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "survey_type",     limit: 4
    t.integer  "user_id",         limit: 4
  end

  add_index "survey_surveys", ["user_id"], name: "index_survey_surveys_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",     null: false
    t.string   "encrypted_password",     limit: 255, default: "",     null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "category_id",            limit: 4
    t.string   "user_type",              limit: 191, default: "user"
    t.datetime "last_seen"
  end

  add_index "users", ["category_id"], name: "index_users_on_category_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "valorations", force: :cascade do |t|
    t.text     "comment",    limit: 65535
    t.integer  "rating",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "client_id",  limit: 4
  end

  add_index "valorations", ["client_id"], name: "index_valorations_on_client_id", using: :btree

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

  add_foreign_key "clientprofiles", "clients", on_delete: :cascade
  add_foreign_key "comments", "clients"
  add_foreign_key "comments", "events"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "coupon_redemptions", "clients", on_delete: :cascade
  add_foreign_key "coupons", "users"
  add_foreign_key "event_comments", "clients"
  add_foreign_key "event_comments", "events"
  add_foreign_key "event_comments", "users"
  add_foreign_key "events", "users"
  add_foreign_key "follows", "clients", name: "follows_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "follows", "profiles", name: "follows_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hearts", "clients", name: "hearts_ibfk_3", on_delete: :cascade
  add_foreign_key "hearts", "posts", name: "hearts_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hearts", "users", name: "hearts_ibfk_2", on_delete: :cascade
  add_foreign_key "items", "clients"
  add_foreign_key "items", "markets"
  add_foreign_key "movies", "users"
  add_foreign_key "offers", "profiles"
  add_foreign_key "pictures", "items"
  add_foreign_key "pictures", "posts"
  add_foreign_key "posts", "profiles"
  add_foreign_key "profiles", "categories", on_delete: :cascade
  add_foreign_key "profiles", "users", on_delete: :cascade
  add_foreign_key "reviews", "clients"
  add_foreign_key "reviews", "profiles"
  add_foreign_key "survey_surveys", "users"
  add_foreign_key "valorations", "clients"
end
