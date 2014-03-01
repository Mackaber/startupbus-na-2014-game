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

ActiveRecord::Schema.define(version: 20140228234937) do

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
    t.integer  "milestone_id",   null: false
    t.integer  "team_id",        null: false
    t.integer  "awarded_points"
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

# Could not dump table "omniauthables" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "team_messages", force: true do |t|
    t.integer  "message_id"
    t.integer  "team_id"
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
  end

  add_index "teams", ["bus_id"], name: "index_teams_on_bus_id"

end
