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

ActiveRecord::Schema.define(version: 20170111023637) do

  create_table "coupons", force: :cascade do |t|
    t.integer  "minimum_spending"
    t.integer  "free_cash"
    t.integer  "events_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.index ["events_id"], name: "index_coupons_on_events_id"
  end

  create_table "coupons_items", id: false, force: :cascade do |t|
    t.integer "item_id",   null: false
    t.integer "coupon_id", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "event_code_type"
    t.integer  "event_code_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["event_code_type", "event_code_id"], name: "index_events_on_event_code_type_and_event_code_id"
  end

  create_table "items", force: :cascade do |t|
    t.text     "description"
    t.string   "image"
    t.integer  "quantity"
    t.integer  "price"
    t.integer  "store_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.index ["store_id"], name: "index_items_on_store_id"
  end

  create_table "items_specials", id: false, force: :cascade do |t|
    t.integer "item_id",    null: false
    t.integer "special_id", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "total_price"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "fee"
    t.datetime "date"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer  "discount"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "store_id"
    t.integer  "events_id"
    t.index ["events_id"], name: "index_seasons_on_events_id"
    t.index ["store_id"], name: "index_seasons_on_store_id"
  end

  create_table "shippings", force: :cascade do |t|
    t.integer "minimum_spending"
    t.integer "discount"
    t.integer "events_id"
    t.index ["events_id"], name: "index_shippings_on_events_id"
  end

  create_table "specials", force: :cascade do |t|
    t.integer  "discount"
    t.integer  "events_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.index ["events_id"], name: "index_specials_on_events_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.string   "image"
    t.integer  "owner_id"
    t.index ["owner_id"], name: "index_stores_on_owner_id"
  end

  create_table "stores_users", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "store_id", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "national_id"
    t.date     "birthdate"
    t.string   "phone"
    t.string   "cellphone"
    t.string   "address"
    t.string   "gender"
    t.boolean  "is_admin"
    t.boolean  "is_owner"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
