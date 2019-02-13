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

ActiveRecord::Schema.define(version: 20190211165453) do

  create_table "parks", force: true do |t|
    t.string   "username",                   null: false
    t.boolean  "report",     default: false, null: false
    t.string   "name",                       null: false
    t.string   "address",                    null: false
    t.string   "city",                       null: false
    t.string   "zipcode",                    null: false
    t.integer  "state_id",                   null: false
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "parks", ["deleted_at"], name: "index_parks_on_deleted_at", using: :btree
  add_index "parks", ["username"], name: "index_parks_on_username", unique: true, using: :btree

  create_table "reports", force: true do |t|
    t.string   "username",                                              null: false
    t.date     "start_date",                                            null: false
    t.date     "end_date",                                              null: false
    t.integer  "accommodations_new_cancelled",                          null: false
    t.decimal  "total_rev",                    precision: 10, scale: 2, null: false
    t.decimal  "total_cash",                   precision: 10, scale: 2, null: false
    t.decimal  "deposits",                     precision: 10, scale: 2, null: false
    t.decimal  "total_credit_card_payments",   precision: 10, scale: 2, null: false
    t.decimal  "transaction_fees",             precision: 10, scale: 2, null: false
    t.decimal  "credit_card_fees",             precision: 10, scale: 2, null: false
    t.decimal  "total_fees",                   precision: 10, scale: 2, null: false
    t.decimal  "distribute_amount",            precision: 10, scale: 2, null: false
    t.string   "file_name",                                             null: false
    t.string   "file_url",                                              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "park_id"
    t.datetime "deleted_at"
  end

  add_index "reports", ["deleted_at"], name: "index_reports_on_deleted_at", using: :btree
  add_index "reports", ["park_id"], name: "index_reports_on_park_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
