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

ActiveRecord::Schema.define(version: 20170530162016) do

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "favorites", ["property_id"], name: "index_favorites_on_property_id"
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id"

  create_table "images", force: :cascade do |t|
    t.string   "property"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string   "address"
    t.integer  "bedrooms"
    t.float    "bathrooms"
    t.integer  "zipcode"
    t.decimal  "price"
    t.boolean  "rent"
    t.text     "description"
    t.integer  "user_id"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "sq_ft"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "properties", ["user_id"], name: "index_properties_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone_number"
    t.boolean  "agent"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
