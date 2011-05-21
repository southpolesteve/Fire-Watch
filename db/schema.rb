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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110521062428) do

  create_table "fire", :force => true do |t|
    t.integer  "incident_num"
    t.string   "type"
    t.string   "location"
    t.string   "station"
    t.string   "unit"
    t.datetime "alarm"
    t.datetime "arrival"
    t.datetime "controlled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fires", :force => true do |t|
    t.string   "location"
    t.string   "station"
    t.string   "unit"
    t.datetime "alarm_at"
    t.datetime "arrival_at"
    t.datetime "controlled_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fire_type"
    t.string   "url"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

end
