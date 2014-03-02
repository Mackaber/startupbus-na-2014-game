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

ActiveRecord::Schema.define(version: 20140302102455) do

  create_table "buses", force: true do |t|
    t.string   "name"
    t.float    "ranking"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
  end

  create_table "games", force: true do |t|
    t.string   "name"
    t.datetime "start_of_game"
    t.datetime "end_of_game"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "investments", force: true do |t|
    t.integer  "investor_id"
    t.integer  "team_id"
    t.decimal  "amount",      precision: 2, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.integer  "game_id"
    t.integer  "clicks"
  end

  create_table "investor_games", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.integer  "investor_id"
    t.integer  "investment_id"
    t.integer  "game_id"
  end

  create_table "investor_team_updates", force: true do |t|
    t.integer  "team_update_id"
    t.integer  "investor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "conductor_id"
    t.integer  "sent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "delivery_method"
  end

  create_table "milestone_teams", force: true do |t|
    t.integer  "milestone_id", null: false
    t.integer  "team_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "approved_by"
    t.string   "url"
    t.text     "description"
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
    t.datetime "start_at"
  end

  add_index "milestones", ["name"], name: "index_milestones_on_name"
  add_index "milestones", ["target_completion_date"], name: "index_milestones_on_target_completion_date"

  create_table "omniauthables", force: true do |t|
    t.string   "type"
    t.string   "email",                                          default: ""
    t.string   "encrypted_password",                             default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                  default: 0
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
    t.decimal  "bank",                   precision: 2, scale: 0, default: 1000
    t.string   "phone_number"
    t.boolean  "imported"
    t.integer  "bus_id"
    t.text     "description"
    t.string   "blog"
    t.string   "facebook"
    t.string   "foursquare"
    t.string   "github"
    t.string   "linkedin"
    t.string   "twitter"
    t.string   "website"
    t.integer  "team_id"
  end

  add_index "omniauthables", ["bus_id"], name: "index_omniauthables_on_bus_id"
  add_index "omniauthables", ["email"], name: "index_omniauthables_on_email", unique: true
  add_index "omniauthables", ["provider", "uid"], name: "index_omniauthables_on_provider_and_uid", unique: true
  add_index "omniauthables", ["reset_password_token"], name: "index_omniauthables_on_reset_password_token", unique: true
  add_index "omniauthables", ["team_id"], name: "index_omniauthables_on_team_id"

  create_table "team_messages", force: true do |t|
    t.integer  "message_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_milestone_requests", force: true do |t|
    t.integer  "milestone_id"
    t.integer  "team_id"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_updates", force: true do |t|
    t.integer  "team_id"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "rss_feed"
    t.string   "logo_url"
    t.string   "short_url"
    t.integer  "clicks"
  end

  add_index "teams", ["bus_id"], name: "index_teams_on_bus_id"

end
