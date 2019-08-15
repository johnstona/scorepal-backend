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

ActiveRecord::Schema.define(version: 2019_08_15_091300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "happened_events", force: :cascade do |t|
    t.string "player"
    t.bigint "match_id"
    t.bigint "match_events_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_events_id"], name: "index_happened_events_on_match_events_id"
    t.index ["match_id"], name: "index_happened_events_on_match_id"
  end

  create_table "match_events", force: :cascade do |t|
    t.string "name"
    t.bigint "sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_match_events_on_sport_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "sport"
    t.integer "opponent_id"
    t.string "opponent_name"
    t.integer "user_score"
    t.integer "opponent_score"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "live"
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "score_events", force: :cascade do |t|
    t.string "name"
    t.integer "point_value"
    t.bigint "sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_score_events_on_sport_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "password"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "happened_events", "match_events", column: "match_events_id"
  add_foreign_key "happened_events", "matches"
  add_foreign_key "match_events", "sports"
  add_foreign_key "matches", "users"
  add_foreign_key "score_events", "sports"
end
