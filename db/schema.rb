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

  create_table "average_caches", id: :integer, force: :cascade do |t|
    t.integer "rater_id"
    t.integer "rateable_id"
    t.string "rateable_type"
    t.float "avg", limit: 24, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", id: :integer, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon", limit: 255
    t.string "ionic_icon"
  end

  create_table "cinemas", id: :integer, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientprofiles", id: :integer, force: :cascade do |t|
    t.string "name"
    t.string "ubication"
    t.text "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cover_file_name"
    t.string "cover_content_type"
    t.integer "cover_file_size"
    t.datetime "cover_updated_at"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer "client_id"
    t.integer "user_id"
    t.index ["client_id"], name: "index_clientprofiles_on_client_id"
    t.index ["user_id"], name: "index_clientprofiles_on_user_id"
  end

  create_table "clients", id: :integer, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "avatar_id"
    t.string "role", limit: 255
    t.string "first_name"
    t.string "last_name"
    t.index ["avatar_id"], name: "index_clients_on_avatar_id"
  end

  create_table "comments", id: :integer, force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_id"
    t.integer "client_id"
    t.integer "user_id"
    t.integer "event_id"
    t.index ["client_id"], name: "index_comments_on_client_id"
    t.index ["event_id"], name: "index_comments_on_event_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "coupon_redemptions", id: :integer, force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "coupon_id"
    t.index ["coupon_id"], name: "index_coupon_redemptions_on_coupon_id"
    t.index ["user_id"], name: "index_coupon_redemptions_on_user_id"
  end

  create_table "coupons", id: :integer, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "ammount", precision: 10
    t.integer "max_redemptions", default: 0
    t.string "code"
    t.string "state", default: "available"
    t.date "start_date"
    t.date "end_date"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.index ["profile_id"], name: "index_coupons_on_profile_id"
  end

  create_table "event_comments", id: :integer, force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
    t.integer "client_id"
    t.integer "user_id"
    t.index ["client_id"], name: "index_event_comments_on_client_id"
    t.index ["event_id"], name: "index_event_comments_on_event_id"
    t.index ["user_id"], name: "index_event_comments_on_user_id"
  end

  create_table "events", id: :integer, force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.time "time"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "cover_file_name"
    t.string "cover_content_type"
    t.integer "cover_file_size"
    t.datetime "cover_updated_at"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "follows", id: :integer, force: :cascade do |t|
    t.integer "profile_id"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["client_id"], name: "index_follows_on_client_id"
    t.index ["profile_id"], name: "index_follows_on_profile_id"
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "galleries", id: :integer, force: :cascade do |t|
    t.string "title", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_id"
    t.index ["post_id"], name: "index_galleries_on_post_id"
  end

  create_table "hearts", id: :integer, force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_hearts_on_client_id"
    t.index ["post_id"], name: "post_id"
    t.index ["user_id"], name: "index_hearts_on_user_id"
  end

  create_table "items", id: :integer, force: :cascade do |t|
    t.string "titulo"
    t.text "descripcion"
    t.decimal "precio", precision: 10
    t.string "ubicacion"
    t.string "estado"
    t.integer "valoracion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.string "moneda"
    t.string "telefono"
    t.string "email"
    t.string "nombre"
    t.integer "market_id"
    t.index ["client_id"], name: "index_items_on_client_id"
    t.index ["market_id"], name: "index_items_on_market_id"
  end

  create_table "markets", id: :integer, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon"
  end

  create_table "master_admins", id: :integer, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_master_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_master_admins_on_reset_password_token", unique: true
  end

  create_table "menus", id: :integer, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", id: :integer, force: :cascade do |t|
    t.string "title"
    t.string "clasification"
    t.text "sinopsis"
    t.string "lang"
    t.string "trailer", limit: 120, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "cover_file_name"
    t.string "cover_content_type"
    t.integer "cover_file_size"
    t.datetime "cover_updated_at"
    t.string "banner_file_name"
    t.string "banner_content_type"
    t.integer "banner_file_size"
    t.datetime "banner_updated_at"
    t.date "date_from", null: false
    t.date "date_until", null: false
    t.text "times", null: false
    t.index ["user_id"], name: "index_movies_on_user_id"
  end

  create_table "offer_saveds", id: :integer, force: :cascade do |t|
    t.integer "user_id"
    t.integer "offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_offer_saveds_on_offer_id"
    t.index ["user_id"], name: "index_offer_saveds_on_user_id"
  end

  create_table "offers", id: :integer, force: :cascade do |t|
    t.string "titulo", limit: 255
    t.text "descripcion"
    t.string "image_file_name", limit: 255
    t.string "image_content_type", limit: 255
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.decimal "precio", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "cordoba"
    t.integer "profile_id"
    t.index ["profile_id"], name: "index_offers_on_profile_id"
  end

  create_table "overall_averages", id: :integer, force: :cascade do |t|
    t.integer "rateable_id"
    t.string "rateable_type"
    t.float "overall_avg", limit: 24, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "panels", id: :integer, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partners", id: :integer, force: :cascade do |t|
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_partners_on_profile_id"
  end

  create_table "pictures", id: :integer, force: :cascade do |t|
    t.string "image_file_name", limit: 255
    t.string "image_content_type", limit: 255
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_id"
    t.integer "item_id"
    t.index ["item_id"], name: "index_pictures_on_item_id"
    t.index ["post_id"], name: "index_pictures_on_post_id"
  end

  create_table "posts", id: :integer, force: :cascade do |t|
    t.string "title", limit: 255
    t.text "body"
    t.integer "visit_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.string "video"
    t.boolean "trending", default: false
    t.boolean "pin", default: false
    t.index ["profile_id"], name: "index_posts_on_profile_id"
  end

  create_table "profiles", id: :integer, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "cover_file_name", limit: 255
    t.string "cover_content_type", limit: 255
    t.integer "cover_file_size"
    t.datetime "cover_updated_at"
    t.text "body"
    t.string "direccion", limit: 255
    t.datetime "horario"
    t.string "facebook", limit: 255
    t.string "twiter", limit: 255
    t.string "instagram", limit: 255
    t.string "youtube", limit: 255
    t.string "other", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "category_id"
    t.string "avatar_file_name", limit: 255
    t.string "avatar_content_type", limit: 255
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "aasm_state"
    t.string "aasm_campaign", default: "noone"
    t.string "offer_section_name", limit: 120, default: "Oferta", null: false
    t.string "keywords"
    t.index ["category_id"], name: "index_profiles_on_category_id"
    t.index ["user_id", "category_id"], name: "user_id_2"
    t.index ["user_id"], name: "user_id"
  end

  create_table "releases", id: :integer, force: :cascade do |t|
    t.decimal "version", precision: 10
    t.text "description"
    t.text "changelog"
    t.string "dwnl_link"
    t.integer "dwnl_count"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_releases_on_client_id"
  end

  create_table "reviews", id: :integer, force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.integer "profile_id"
    t.integer "user_id"
    t.index ["client_id"], name: "index_reviews_on_client_id"
    t.index ["profile_id"], name: "index_reviews_on_profile_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "survey_answers", id: :integer, force: :cascade do |t|
    t.integer "attempt_id"
    t.integer "question_id"
    t.integer "option_id"
    t.boolean "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_attempts", id: :integer, force: :cascade do |t|
    t.integer "participant_id"
    t.string "participant_type"
    t.integer "survey_id"
    t.boolean "winner"
    t.integer "score"
  end

  create_table "survey_options", id: :integer, force: :cascade do |t|
    t.integer "question_id"
    t.integer "weight", default: 0
    t.string "text"
    t.boolean "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_questions", id: :integer, force: :cascade do |t|
    t.integer "survey_id"
    t.string "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_surveys", id: :integer, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "attempts_number", default: 0
    t.boolean "finished", default: false
    t.boolean "active", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "survey_type"
    t.integer "user_id"
    t.index ["user_id"], name: "index_survey_surveys_on_user_id"
  end

  create_table "todos", id: :integer, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "state", default: "open"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :integer, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.integer "user_lvl", default: 1
    t.string "name"
    t.string "last_name"
    t.string "provider"
    t.string "uid"
    t.string "token"
    t.datetime "oauth_expires_at"
    t.index ["category_id"], name: "index_users_on_category_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "valorations", id: :integer, force: :cascade do |t|
    t.text "comment"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.index ["client_id"], name: "index_valorations_on_client_id"
  end

  create_table "verification_requests", id: :integer, force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_verification_requests_on_user_id"
  end

  create_table "verifications", id: :integer, force: :cascade do |t|
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_verifications_on_profile_id"
  end

  create_table "wikis", id: :integer, force: :cascade do |t|
    t.string "title", limit: 255
    t.text "body"
    t.integer "likes"
    t.integer "visit_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cover_file_name", limit: 255
    t.string "cover_content_type", limit: 255
    t.integer "cover_file_size"
    t.datetime "cover_updated_at"
  end

  add_foreign_key "clientprofiles", "clients", on_delete: :cascade
  add_foreign_key "comments", "clients"
  add_foreign_key "comments", "events"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "coupon_redemptions", "coupons"
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
