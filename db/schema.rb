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

ActiveRecord::Schema.define(version: 20161230025603) do

  create_table "forms", force: :cascade do |t|
    t.string   "date"
    t.string   "manufacturer"
    t.string   "model"
    t.string   "hood_size"
    t.string   "location"
    t.integer  "e1",                          default: 0
    t.integer  "e2",                          default: 0
    t.integer  "e3",                          default: 0
    t.integer  "e4",                          default: 0
    t.integer  "e5",                          default: 0
    t.integer  "e6",                          default: 0
    t.integer  "e7",                          default: 0
    t.integer  "e8",                          default: 0
    t.integer  "e9",                          default: 0
    t.integer  "e10",                         default: 0
    t.integer  "e11",                         default: 0
    t.integer  "e12",                         default: 0
    t.integer  "e13",                         default: 0
    t.integer  "e14",                         default: 0
    t.integer  "e15",                         default: 0
    t.integer  "total_exhaust_cfm"
    t.float    "exhaust_test_velocities"
    t.float    "exhaust_filter_size_1"
    t.float    "exhaust_filter_size_2"
    t.string   "exhaust_filter_manufacturer"
    t.float    "exhaust_average_velocity"
    t.float    "exhaust_filter_area"
    t.float    "exhaust_filter_factor"
    t.integer  "number_of_exhaust_filters"
    t.string   "remarks"
    t.float    "duct_size_1"
    t.float    "duct_size_2"
    t.integer  "number_of_supply_inputs"
    t.integer  "s1",                          default: 0
    t.integer  "s2",                          default: 0
    t.integer  "s3",                          default: 0
    t.integer  "s4",                          default: 0
    t.integer  "s5",                          default: 0
    t.integer  "s6",                          default: 0
    t.integer  "s7",                          default: 0
    t.integer  "s8",                          default: 0
    t.integer  "s9",                          default: 0
    t.integer  "s10",                         default: 0
    t.integer  "total_supply_cfm"
    t.float    "supply_test_velocities"
    t.float    "supply_filter_size_1"
    t.float    "supply_filter_size_2"
    t.string   "supply_filter_manufacturer"
    t.float    "supply_average_velocity"
    t.float    "supply_opening_area"
    t.float    "supply_area_factor"
    t.integer  "exhaust_design_data"
    t.integer  "make_up_design_data"
    t.integer  "percentage"
    t.string   "title"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

end
