# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_02_083751) do

  create_table "competitions", force: :cascade do |t|
    t.integer "team1_id"
    t.integer "team2_id"
    t.integer "game_id"
    t.integer "game_week"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "winner_id"
    t.integer "loser_id"
    t.integer "team1_total_score", default: 0
    t.integer "team2_total_score", default: 0
    t.integer "team1_player1_score", default: 0
    t.integer "team1_player2_score", default: 0
    t.integer "team1_player3_score", default: 0
    t.integer "team1_player4_score", default: 0
    t.integer "team1_player5_score", default: 0
    t.integer "team1_player6_score", default: 0
    t.integer "team1_player7_score", default: 0
    t.integer "team2_player1_score", default: 0
    t.integer "team2_player2_score", default: 0
    t.integer "team2_player3_score", default: 0
    t.integer "team2_player4_score", default: 0
    t.integer "team2_player5_score", default: 0
    t.integer "team2_player6_score", default: 0
    t.integer "team2_player7_score", default: 0
    t.boolean "scored", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.string "nfl_team"
    t.integer "projected_points"
    t.integer "team_id", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_teams", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
  end

end
