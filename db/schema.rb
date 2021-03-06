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

ActiveRecord::Schema.define(version: 20161129172640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.date     "date"
    t.string   "description"
    t.integer  "team_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["team_id"], name: "index_events_on_team_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.date     "date"
    t.integer  "home_score"
    t.integer  "guest_score"
    t.integer  "home_id"
    t.integer  "guest_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["guest_id"], name: "index_games_on_guest_id", using: :btree
    t.index ["home_id"], name: "index_games_on_home_id", using: :btree
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "league_name"
    t.string   "sport"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_leagues_on_user_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "team_name"
    t.string   "picture"
    t.string   "symbol"
    t.string   "tag"
    t.integer  "league_id"
    t.integer  "manager_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.string   "symbol_file_name"
    t.string   "symbol_content_type"
    t.integer  "symbol_file_size"
    t.datetime "symbol_updated_at"
    t.index ["league_id"], name: "index_teams_on_league_id", using: :btree
    t.index ["manager_id"], name: "index_teams_on_manager_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "events", "teams"
  add_foreign_key "leagues", "users"
  add_foreign_key "teams", "leagues"
end
