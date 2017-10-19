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

ActiveRecord::Schema.define(version: 20171019222000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.boolean "submitted", default: false
    t.boolean "processed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders_parts", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "part_id"
    t.integer "quantity_ordered", null: false
    t.integer "quantity_received"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_orders_parts_on_order_id"
    t.index ["part_id"], name: "index_orders_parts_on_part_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string "name", null: false
    t.integer "min"
    t.integer "max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts_warehouses", force: :cascade do |t|
    t.bigint "warehouse_id"
    t.bigint "part_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_id"], name: "index_parts_warehouses_on_part_id"
    t.index ["warehouse_id"], name: "index_parts_warehouses_on_warehouse_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "name", null: false
    t.string "location", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
