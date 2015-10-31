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

ActiveRecord::Schema.define(version: 20151031001535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "assets", force: :cascade do |t|
    t.string   "filename"
    t.string   "type"
    t.integer  "assetable_id"
    t.string   "assetable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "assets", ["assetable_id"], name: "index_assets_on_assetable_id", using: :btree
  add_index "assets", ["assetable_type"], name: "index_assets_on_assetable_type", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.integer  "sort_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_menus", force: :cascade do |t|
    t.string   "day_number"
    t.float    "max_total"
    t.integer  "dish_ids",   default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "daily_menus", ["dish_ids"], name: "index_daily_menus_on_dish_ids", using: :btree

  create_table "daily_rations", force: :cascade do |t|
    t.float    "price"
    t.integer  "quantity"
    t.integer  "person_id"
    t.integer  "daily_menu_id"
    t.integer  "spriny_id"
    t.integer  "dish_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "daily_rations", ["daily_menu_id"], name: "index_daily_rations_on_daily_menu_id", using: :btree
  add_index "daily_rations", ["dish_id"], name: "index_daily_rations_on_dish_id", using: :btree
  add_index "daily_rations", ["person_id"], name: "index_daily_rations_on_person_id", using: :btree
  add_index "daily_rations", ["spriny_id"], name: "index_daily_rations_on_spriny_id", using: :btree

  create_table "dishes", force: :cascade do |t|
    t.string   "title"
    t.integer  "sort_order"
    t.text     "description"
    t.float    "price"
    t.string   "type"
    t.integer  "children_ids", default: [],              array: true
    t.integer  "category_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "dishes", ["category_id"], name: "index_dishes_on_category_id", using: :btree
  add_index "dishes", ["children_ids"], name: "index_dishes_on_children_ids", using: :btree
  add_index "dishes", ["type"], name: "index_dishes_on_type", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "people", ["email"], name: "index_people_on_email", unique: true, using: :btree
  add_index "people", ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true, using: :btree

  create_table "sprints", force: :cascade do |t|
    t.string   "title"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string   "aasm_state"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
