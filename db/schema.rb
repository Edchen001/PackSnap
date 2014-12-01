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

ActiveRecord::Schema.define(version: 20141201172312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string "name", null: false
  end

  create_table "climate_types", force: true do |t|
    t.string "code",        null: false
    t.string "name",        null: false
    t.text   "description", null: false
  end

  create_table "coordinates", force: true do |t|
    t.float "longitude", null: false
    t.float "latitude",  null: false
  end

  create_table "items", force: true do |t|
    t.string "name"
    t.string "url"
  end

  create_table "itineraries", force: true do |t|
    t.date     "start_date", null: false
    t.date     "end_date",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trip_id"
  end

  create_table "locations", force: true do |t|
    t.integer "itinerary_id"
    t.string  "address",       null: false
    t.integer "coordinate_id", null: false
  end

  create_table "photos", force: true do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "scopes", force: true do |t|
    t.float   "minimum"
    t.float   "maximum"
    t.integer "category_id"
  end

  create_table "suggestions", force: true do |t|
    t.integer "item_id"
    t.integer "category_id"
  end

  create_table "travel_dates", force: true do |t|
    t.date     "current_date", null: false
    t.integer  "itinerary_id", null: false
    t.integer  "weather_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.string  "title",       null: false
    t.string  "description"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weathers", force: true do |t|
    t.float   "fahrenheit"
    t.float   "celsius"
    t.integer "travel_date_id"
  end

end
