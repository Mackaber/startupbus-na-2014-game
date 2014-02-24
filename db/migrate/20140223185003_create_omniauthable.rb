class CreateOmniauthable < ActiveRecord::Migration
  def up
    create_table :omniauthables do |t|
      t.string   :type
      t.string   :email,                  default: ""
      t.string   :encrypted_password,     default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer  :sign_in_count,          default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.string   :provider
      t.string   :uid

      t.string   :username
      t.string   :name

      t.datetime :approved_at
      t.integer  :approved_by

      t.timestamps
    end

    add_index "omniauthables", ["email"], unique: true
    add_index "omniauthables", ["reset_password_token"], unique: true

    remove_index "users", name: "index_users_on_email"
    remove_index "users", name: "index_users_on_reset_password_token"
    drop_table :users

    remove_index "investors", name: "index_investors_on_email"
    remove_index "investors", name: "index_investors_on_reset_password_token"
    drop_table :investors

    remove_index "conductors", name: "index_conductors_on_email"
    remove_index "conductors", name: "index_conductors_on_reset_password_token"
    drop_table :conductors
  end

  def down
    remove_index "omniauthables", name: "index_omniauthables_on_email"
    remove_index "omniauthables", name: "index_omniauthables_on_reset_password_token"
    drop_table :omniauthables

    create_table "conductors", force: true do |t|
      t.string   "email",                  default: "", null: false
      t.string   "encrypted_password",     default: "", null: false
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",          default: 0
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "provider"
      t.string   "uid"
      t.datetime "approved_at"
    end

    add_index "conductors", ["email"], name: "index_conductors_on_email", unique: true
    add_index "conductors", ["reset_password_token"], name: "index_conductors_on_reset_password_token", unique: true

    create_table "investors", force: true do |t|
      t.string   "email",                  default: "", null: false
      t.string   "encrypted_password",     default: "", null: false
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",          default: 0
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "provider"
      t.string   "uid"
    end

    add_index "investors", ["email"], name: "index_investors_on_email", unique: true
    add_index "investors", ["reset_password_token"], name: "index_investors_on_reset_password_token", unique: true

    create_table "users", force: true do |t|
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
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "provider"
      t.string   "uid"
      t.string   "username"
      t.string   "name"
      t.string   "first_name"
      t.string   "last_name"
      t.integer  "team_id"
      t.string   "team_status"
      t.datetime "approved_at"
      t.integer  "approved_by"
    end

    add_index "users", ["email"], name: "index_users_on_email", unique: true
    add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
end
