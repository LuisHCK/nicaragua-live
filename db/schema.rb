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

  create_table "average_caches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "avg",           limit: 24, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "icon",       limit: 255
  end

  create_table "cinemas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientprofiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "name"
    t.string   "ubication"
    t.text     "biography",           limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "client_id"
    t.integer  "user_id"
    t.index ["client_id"], name: "index_clientprofiles_on_client_id", using: :btree
    t.index ["user_id"], name: "index_clientprofiles_on_user_id", using: :btree
  end

  create_table "clients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "avatar_id"
    t.string   "role",                   limit: 255
    t.string   "first_name"
    t.string   "last_name"
    t.index ["avatar_id"], name: "index_clients_on_avatar_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.text     "body",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "post_id"
    t.integer  "client_id"
    t.integer  "user_id"
    t.integer  "event_id"
    t.index ["client_id"], name: "index_comments_on_client_id", using: :btree
    t.index ["event_id"], name: "index_comments_on_event_id", using: :btree
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "coupon_redemptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "coupon_id",                      null: false
    t.integer  "client_id"
    t.string   "unique_code"
    t.string   "state",       default: "active", null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id"
    t.index ["client_id"], name: "index_coupon_redemptions_on_client_id", using: :btree
    t.index ["unique_code"], name: "unique_code", unique: true, using: :btree
    t.index ["user_id"], name: "index_coupon_redemptions_on_user_id", using: :btree
  end

  create_table "coupons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "code",                                                    null: false
    t.string   "description"
    t.date     "valid_from",                                              null: false
    t.date     "valid_until"
    t.integer  "redemption_limit",                     default: 1,        null: false
    t.integer  "coupon_redemptions_count",             default: 0,        null: false
    t.integer  "amount",                               default: 0,        null: false
    t.string   "type"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.string   "state",                    limit: 120, default: "active"
    t.integer  "user_id"
    t.integer  "profiles_id"
    t.integer  "profile_id"
    t.index ["profile_id"], name: "index_coupons_on_profile_id", using: :btree
    t.index ["profiles_id"], name: "index_coupons_on_profiles_id", using: :btree
    t.index ["user_id"], name: "index_coupons_on_user_id", using: :btree
  end

  create_table "event_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.text     "body",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "event_id"
    t.integer  "client_id"
    t.integer  "user_id"
    t.index ["client_id"], name: "index_event_comments_on_client_id", using: :btree
    t.index ["event_id"], name: "index_event_comments_on_event_id", using: :btree
    t.index ["user_id"], name: "index_event_comments_on_user_id", using: :btree
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "title"
    t.date     "date"
    t.time     "time"
    t.text     "description",        limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "follows", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "profile_id"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["client_id"], name: "index_follows_on_client_id", using: :btree
    t.index ["profile_id"], name: "index_follows_on_profile_id", using: :btree
    t.index ["user_id"], name: "index_follows_on_user_id", using: :btree
  end

  create_table "galleries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "post_id"
    t.index ["post_id"], name: "index_galleries_on_post_id", using: :btree
  end

  create_table "hearts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_hearts_on_client_id", using: :btree
    t.index ["post_id"], name: "index_hearts_on_post_id", using: :btree
    t.index ["post_id"], name: "post_id", using: :btree
    t.index ["user_id"], name: "index_hearts_on_user_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "titulo"
    t.text     "descripcion", limit: 65535
    t.decimal  "precio",                    precision: 10
    t.string   "ubicacion"
    t.string   "estado"
    t.integer  "valoracion"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "client_id"
    t.string   "moneda"
    t.string   "telefono"
    t.string   "email"
    t.string   "nombre"
    t.integer  "market_id"
    t.index ["client_id"], name: "index_items_on_client_id", using: :btree
    t.index ["market_id"], name: "index_items_on_market_id", using: :btree
  end

  create_table "markets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "icon"
  end

  create_table "master_admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["email"], name: "index_master_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_master_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "menus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "title"
    t.string   "clasification"
    t.text     "sinopsis",            limit: 65535
    t.string   "lang"
    t.string   "trailer",             limit: 120,   null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "user_id"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.date     "date_from",                         null: false
    t.date     "date_until",                        null: false
    t.text     "times",               limit: 65535, null: false
    t.index ["user_id"], name: "index_movies_on_user_id", using: :btree
  end

  create_table "offer_saveds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "user_id"
    t.integer  "offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_offer_saveds_on_offer_id", using: :btree
    t.index ["user_id"], name: "index_offer_saveds_on_user_id", using: :btree
  end

  create_table "offers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "titulo",             limit: 255
    t.text     "descripcion",        limit: 65535
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.decimal  "precio",                           precision: 10
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.boolean  "cordoba"
    t.integer  "profile_id"
    t.index ["profile_id"], name: "index_offers_on_profile_id", using: :btree
  end

  create_table "overall_averages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "overall_avg",   limit: 24, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "panels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_partners_on_profile_id", using: :btree
  end

  create_table "pictures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "post_id"
    t.integer  "item_id"
    t.index ["item_id"], name: "index_pictures_on_item_id", using: :btree
    t.index ["post_id"], name: "index_pictures_on_post_id", using: :btree
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "title",       limit: 255
    t.text     "body",        limit: 65535
    t.integer  "visit_count"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "profile_id"
    t.string   "video"
    t.boolean  "trending",                  default: false
    t.boolean  "pin",                       default: false
    t.index ["profile_id"], name: "index_posts_on_profile_id", using: :btree
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "name",                limit: 255
    t.string   "cover_file_name",     limit: 255
    t.string   "cover_content_type",  limit: 255
    t.integer  "cover_file_size"
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
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "aasm_state"
    t.string   "aasm_campaign",                     default: "noone"
    t.string   "offer_section_name",  limit: 120,   default: "Oferta", null: false
    t.string   "keywords"
    t.index ["category_id"], name: "index_profiles_on_category_id", using: :btree
    t.index ["user_id", "category_id"], name: "user_id_2", using: :btree
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
    t.index ["user_id"], name: "user_id", using: :btree
  end

  create_table "releases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.decimal  "version",                   precision: 10
    t.text     "description", limit: 65535
    t.text     "changelog",   limit: 65535
    t.string   "dwnl_link"
    t.integer  "dwnl_count"
    t.integer  "client_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["client_id"], name: "index_releases_on_client_id", using: :btree
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "rating"
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "client_id"
    t.integer  "profile_id"
    t.integer  "user_id"
    t.index ["client_id"], name: "index_reviews_on_client_id", using: :btree
    t.index ["profile_id"], name: "index_reviews_on_profile_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "survey_answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "attempt_id"
    t.integer  "question_id"
    t.integer  "option_id"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_attempts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer "participant_id"
    t.string  "participant_type"
    t.integer "survey_id"
    t.boolean "winner"
    t.integer "score"
  end

  create_table "survey_options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "question_id"
    t.integer  "weight",      default: 0
    t.string   "text"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "survey_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_surveys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "name"
    t.text     "description",     limit: 65535
    t.integer  "attempts_number",               default: 0
    t.boolean  "finished",                      default: false
    t.boolean  "active",                        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "survey_type"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_survey_surveys_on_user_id", using: :btree
  end

  create_table "todos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "title"
    t.text     "body",       limit: 65535
    t.string   "state",                    default: "open"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "category_id"
    t.integer  "user_lvl",                           default: 1
    t.string   "name"
    t.string   "last_name"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "oauth_expires_at"
    t.index ["category_id"], name: "index_users_on_category_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "valorations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.text     "comment",    limit: 65535
    t.integer  "rating"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "client_id"
    t.index ["client_id"], name: "index_valorations_on_client_id", using: :btree
  end

  create_table "verification_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_verification_requests_on_user_id", using: :btree
  end

  create_table "verifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_verifications_on_profile_id", using: :btree
  end

  create_table "wikis", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "title",              limit: 255
    t.text     "body",               limit: 65535
    t.integer  "likes"
    t.integer  "visit_count"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "cover_file_name",    limit: 255
    t.string   "cover_content_type", limit: 255
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
  end

  add_foreign_key "clientprofiles", "clients", on_delete: :cascade
  add_foreign_key "comments", "clients"
  add_foreign_key "comments", "events"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "coupon_redemptions", "users"
  add_foreign_key "coupons", "profiles"
  add_foreign_key "event_comments", "clients"
  add_foreign_key "event_comments", "events"
  add_foreign_key "event_comments", "users"
  add_foreign_key "events", "users"
  add_foreign_key "follows", "profiles", name: "follows_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "follows", "users"
  add_foreign_key "hearts", "clients", name: "hearts_ibfk_3", on_delete: :cascade
  add_foreign_key "hearts", "posts", name: "hearts_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hearts", "users", name: "hearts_ibfk_2", on_delete: :cascade
  add_foreign_key "items", "clients"
  add_foreign_key "items", "markets"
  add_foreign_key "movies", "users"
  add_foreign_key "offer_saveds", "offers"
  add_foreign_key "offer_saveds", "users"
  add_foreign_key "offers", "profiles"
  add_foreign_key "partners", "profiles"
  add_foreign_key "pictures", "items"
  add_foreign_key "pictures", "posts"
  add_foreign_key "posts", "profiles"
  add_foreign_key "profiles", "categories", on_delete: :cascade
  add_foreign_key "profiles", "users", on_delete: :cascade
  add_foreign_key "releases", "clients"
  add_foreign_key "reviews", "profiles"
  add_foreign_key "reviews", "users"
  add_foreign_key "survey_surveys", "users"
  add_foreign_key "valorations", "clients"
  add_foreign_key "verification_requests", "users"
  add_foreign_key "verifications", "profiles"
end
