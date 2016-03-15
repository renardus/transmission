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

ActiveRecord::Schema.define(version: 20160314114557) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "ancestry"
    t.integer  "ancestry_depth",    default: 0
    t.string   "names_depth_cache"
    t.boolean  "retrievable"
    t.string   "remarks"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry"

  create_table "descriptors", force: :cascade do |t|
    t.integer  "source_id",  null: false
    t.integer  "part_id",    null: false
    t.string   "name",       null: false
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name"
    t.string   "value_type"
    t.string   "default_value"
    t.text     "possible_values"
    t.string   "upper_boundary"
    t.string   "lower_boundary"
    t.boolean  "is_required"
    t.boolean  "is_fixed"
    t.boolean  "is_in_row"
    t.string   "hint"
    t.string   "placeholder"
    t.string   "label"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "sources", force: :cascade do |t|
    t.string   "ancestry"
    t.string   "name",        null: false
    t.integer  "category_id", null: false
    t.integer  "user_id"
    t.text     "remarks"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sources", ["ancestry"], name: "index_sources_on_ancestry"
  add_index "sources", ["name"], name: "index_sources_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
