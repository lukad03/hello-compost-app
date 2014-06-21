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

ActiveRecord::Schema.define(version: 20140621020108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "organization_id"
  end

  create_table "clients", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.integer  "location_id"
    t.string   "username"
  end

  create_table "credits", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "value"
    t.integer  "client_id"
  end

  create_table "debits", force: true do |t|
    t.integer  "client_id",  null: false
    t.integer  "value",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "debits", ["client_id"], name: "index_debits_on_client_id", using: :btree

  create_table "facilitator_locations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
    t.integer  "facilitator_id"
  end

  create_table "facilitators", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.string   "name"
  end

  create_table "invite_locations", force: true do |t|
    t.integer  "location_id", null: false
    t.integer  "invite_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invite_locations", ["invite_id"], name: "index_invite_locations_on_invite_id", using: :btree
  add_index "invite_locations", ["location_id"], name: "index_invite_locations_on_location_id", using: :btree

  create_table "invites", force: true do |t|
    t.string  "email",           null: false
    t.string  "string"
    t.string  "invited_at"
    t.string  "redeemed_at"
    t.integer "organization_id", null: false
  end

  add_index "invites", ["organization_id"], name: "index_invites_on_organization_id", using: :btree

  create_table "locations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.string   "name"
    t.float    "latitude"
    t.string   "longitude"
    t.string   "float"
    t.string   "address"
  end

  create_table "organizations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "scraps", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "weight",     precision: 5, scale: 2
    t.integer  "client_id"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.integer  "rolable_id"
    t.string   "rolable_type"
    t.string   "user_type"
    t.integer  "organization_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
