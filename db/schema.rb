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

ActiveRecord::Schema.define(version: 20170104045011) do

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
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer  "discount"
    t.integer  "events_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.index ["events_id"], name: "index_seasons_on_events_id"
  end

  create_table "shippings", force: :cascade do |t|
    t.integer "minimum_spending"
    t.integer "discount"
    t.integer "events_id"
    t.index ["events_id"], name: "index_shippings_on_events_id"
  end

  create_table "specials", force: :cascade do |t|
    t.integer  "minimum_spending"
    t.integer  "discount"
    t.integer  "free_cash"
    t.integer  "events_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.index ["events_id"], name: "index_specials_on_events_id"
  end

  create_table "specials_items", id: false, force: :cascade do |t|
    t.integer "item_id"
    t.integer "special_id"
    t.index ["item_id"], name: "index_specials_items_on_item_id"
    t.index ["special_id"], name: "index_specials_items_on_special_id"
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
