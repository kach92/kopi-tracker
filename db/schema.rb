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

ActiveRecord::Schema.define(version: 2019_08_15_090049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "name"
  end

  create_table "customers_kopis", force: :cascade do |t|
    t.bigint "kopi_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customers_kopis_on_customer_id"
    t.index ["kopi_id"], name: "index_customers_kopis_on_kopi_id"
  end

  create_table "kopis", force: :cascade do |t|
    t.text "name"
    t.bigint "origin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "roast_id"
    t.decimal "price_per_pound", precision: 4, scale: 2
    t.index ["origin_id"], name: "index_kopis_on_origin_id"
    t.index ["roast_id"], name: "index_kopis_on_roast_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "weight", precision: 4, scale: 2
    t.bigint "kopi_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "user_id"
    t.index ["kopi_id"], name: "index_orders_on_kopi_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "origins", force: :cascade do |t|
    t.text "location"
    t.text "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roasts", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "orders", "users"
end
