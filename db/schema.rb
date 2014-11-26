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

ActiveRecord::Schema.define(version: 20141126223754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "itineraries", force: true do |t|
    t.date     "start_date", null: false
    t.date     "end_date",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trip_id"
  end

  create_table "locations", force: true do |t|
    t.string  "name",         null: false
    t.integer "itinerary_id"
  end

  create_table "travel_dates", force: true do |t|
    t.date     "current_date", null: false
    t.integer  "itinerary_id", null: false
    t.integer  "weather_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.string "title",       null: false
    t.string "description"
  end

  create_table "weathers", force: true do |t|
    t.float   "fahrenheit"
    t.float   "celsius"
    t.integer "travel_date_id"
  end

end
