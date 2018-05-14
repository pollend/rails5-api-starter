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

ActiveRecord::Schema.define(version: 20180219185945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chapters", force: :cascade do |t|
    t.string  "name"
    t.integer "university_id"
    t.index ["university_id"], name: "index_chapters_on_university_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "start"
    t.datetime "end"
    t.decimal  "lat"
    t.decimal  "long"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "chapter_id"
    t.index ["chapter_id"], name: "index_events_on_chapter_id", using: :btree
  end

  create_table "oauth2_user_infos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_oauth2_user_infos_on_user_id", using: :btree
  end

  create_table "rrules", force: :cascade do |t|
    t.integer  "freq"
    t.integer  "interval"
    t.integer  "by_hour"
    t.integer  "by_minute"
    t.integer  "by_month_day"
    t.integer  "by_year_day",    default: [],              array: true
    t.integer  "by_day",         default: [],              array: true
    t.datetime "ex_dates",       default: [],              array: true
    t.integer  "by_week_number", default: [],              array: true
    t.integer  "by_month",       default: [],              array: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "tags_events", id: false, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "event_id"
    t.index ["event_id"], name: "index_tags_events_on_event_id", using: :btree
    t.index ["tag_id"], name: "index_tags_events_on_tag_id", using: :btree
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
  end

  create_table "user_emails", force: :cascade do |t|
    t.string   "email"
    t.integer  "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_user_emails_on_users_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "admin",                  default: false, null: false
    t.boolean  "moderator",              default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "primary_user_email_id"
    t.index ["primary_user_email_id"], name: "index_users_on_primary_user_email_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "chapters", "universities"
  add_foreign_key "events", "chapters"
  add_foreign_key "oauth2_user_infos", "users"
  add_foreign_key "tags_events", "events"
  add_foreign_key "tags_events", "tags"
end
