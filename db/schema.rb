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

ActiveRecord::Schema.define(version: 20151111064802) do

  create_table "campaign_entries", force: :cascade do |t|
    t.decimal  "media_spend",           precision: 10
    t.decimal  "impressions",           precision: 10
    t.integer  "clicks",      limit: 4
    t.decimal  "ctr",                   precision: 10
    t.integer  "conversions", limit: 4
    t.decimal  "e_cpm",                 precision: 10
    t.decimal  "e_cpc",                 precision: 10
    t.decimal  "e_cpa",                 precision: 10
    t.decimal  "spent",                 precision: 10
    t.integer  "campaign_id", limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "campaign_entries", ["campaign_id"], name: "index_campaign_entries_on_campaign_id", using: :btree

  create_table "campaigns", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "media_budget",             precision: 10
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.integer  "report_id",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "comments", ["report_id"], name: "index_comments_on_report_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.integer  "campaign_id",      limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "pdf_file_name",    limit: 255
    t.string   "pdf_content_type", limit: 255
    t.integer  "pdf_file_size",    limit: 4
    t.datetime "pdf_updated_at"
  end

  add_index "reports", ["campaign_id"], name: "index_reports_on_campaign_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "username",               limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "campaign_entries", "campaigns"
  add_foreign_key "comments", "reports"
  add_foreign_key "reports", "campaigns"
end
