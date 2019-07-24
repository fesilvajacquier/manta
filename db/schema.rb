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

ActiveRecord::Schema.define(version: 2019_07_23_201602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "offer_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_messages_on_offer_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "ngo_members", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "ngo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ngo_id"], name: "index_ngo_members_on_ngo_id"
    t.index ["user_id"], name: "index_ngo_members_on_user_id"
  end

  create_table "ngos", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "email"
    t.string "website"
    t.text "description"
    t.integer "bank_account"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ngos_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "publication_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_offers_on_publication_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "photo"
    t.integer "imageable_id"
    t.string "imageable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id"
  end

  create_table "publications", force: :cascade do |t|
    t.bigint "ngo_id"
    t.string "title"
    t.text "description"
    t.text "intended_use"
    t.string "category"
    t.string "sub_category"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ngo_id"], name: "index_publications_on_ngo_id"
  end

  create_table "reports", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "ngo_id"
    t.string "category"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ngo_id"], name: "index_reports_on_ngo_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "token"
    t.integer "expires_at"
    t.boolean "expires"
    t.string "refresh_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "offers"
  add_foreign_key "messages", "users"
  add_foreign_key "ngo_members", "ngos"
  add_foreign_key "ngo_members", "users"
  add_foreign_key "ngos", "users"
  add_foreign_key "offers", "publications"
  add_foreign_key "offers", "users"
  add_foreign_key "publications", "ngos"
  add_foreign_key "reports", "ngos"
  add_foreign_key "reports", "users"
end
