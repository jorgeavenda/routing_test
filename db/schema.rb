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

ActiveRecord::Schema.define(version: 20190911001710) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities_drivers", force: :cascade do |t|
    t.integer  "city_id"
    t.integer  "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_cities_drivers_on_city_id", using: :btree
    t.index ["driver_id"], name: "index_cities_drivers_on_driver_id", using: :btree
  end

  create_table "cities_routes", force: :cascade do |t|
    t.integer  "city_id"
    t.integer  "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_cities_routes_on_city_id", using: :btree
    t.index ["route_id"], name: "index_cities_routes_on_route_id", using: :btree
  end

  create_table "drivers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loads", force: :cascade do |t|
    t.string   "name"
    t.integer  "load_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.decimal  "load_sum"
    t.integer  "stops_amount"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "load_id"
    t.integer  "vehicle_id"
    t.integer  "driver_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["driver_id"], name: "index_routes_on_driver_id", using: :btree
    t.index ["load_id"], name: "index_routes_on_load_id", using: :btree
    t.index ["vehicle_id"], name: "index_routes_on_vehicle_id", using: :btree
  end

  create_table "vehicles", force: :cascade do |t|
    t.decimal  "capacity"
    t.integer  "load_id"
    t.integer  "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_vehicles_on_driver_id", using: :btree
    t.index ["load_id"], name: "index_vehicles_on_load_id", using: :btree
  end

end
