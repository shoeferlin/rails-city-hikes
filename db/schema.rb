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

ActiveRecord::Schema.define(version: 2018_06_05_132940) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "locality"
    t.string "picture_url"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "country", limit: 2
  end

  create_table "hiked_routes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_hiked_routes_on_route_id"
    t.index ["user_id"], name: "index_hiked_routes_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "user_id"
    t.bigint "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_reviews_on_route_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "route_pictures", force: :cascade do |t|
    t.bigint "route_id"
    t.string "route_picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_route_pictures_on_route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "public", default: false
    t.bigint "user_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "time", default: 0.0
    t.float "distance", default: 0.0
    t.integer "no_exports", default: 0
    t.index ["city_id"], name: "index_routes_on_city_id"
    t.index ["user_id"], name: "index_routes_on_user_id"
  end

  create_table "sights", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "category"
    t.string "picture_url"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "place_id"
    t.string "url"
    t.string "website"
    t.string "formatted_address"
    t.string "photo"
    t.integer "list_nr"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false
    t.string "picture_url"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "waypoints", force: :cascade do |t|
    t.bigint "route_id"
    t.bigint "sight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "list_nr", default: 0
    t.index ["route_id"], name: "index_waypoints_on_route_id"
    t.index ["sight_id"], name: "index_waypoints_on_sight_id"
  end

  add_foreign_key "hiked_routes", "routes"
  add_foreign_key "hiked_routes", "users"
  add_foreign_key "reviews", "routes"
  add_foreign_key "reviews", "users"
  add_foreign_key "route_pictures", "routes"
  add_foreign_key "routes", "cities"
  add_foreign_key "routes", "users"
  add_foreign_key "waypoints", "routes"
  add_foreign_key "waypoints", "sights"
end
