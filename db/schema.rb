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

ActiveRecord::Schema.define(version: 20140223204035) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "buses", force: true do |t|
    t.string   "name"
    t.float    "ranking"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "investments", force: true do |t|
    t.integer  "investor_id"
    t.integer  "team_id"
    t.decimal  "amount",      precision: 2, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "milestones", force: true do |t|
    t.string   "name",                                null: false
    t.text     "description"
    t.integer  "max_points",              default: 0
    t.datetime "target_completion_date"
    t.text     "validation_instructions"
    t.text     "public_instructions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "milestones", ["name"], name: "index_milestones_on_name"
  add_index "milestones", ["target_completion_date"], name: "index_milestones_on_target_completion_date"

  create_table "omniauthables", force: true do |t|
    t.string   "type"
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.string   "name"
    t.datetime "approved_at"
    t.integer  "approved_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachable_type"
    t.integer  "attachable_id"
  end

  add_index "omniauthables", ["email"], name: "index_omniauthables_on_email", unique: true
  add_index "omniauthables", ["reset_password_token"], name: "index_omniauthables_on_reset_password_token", unique: true

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "twitter_handle"
    t.string   "facebook_url"
    t.string   "github_url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bus_id"
  end

  add_index "teams", ["bus_id"], name: "index_teams_on_bus_id"

end
