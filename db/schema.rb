# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_04_073348) do

  create_table "game_genres", force: :cascade do |t|
    t.integer "video_game_id"
    t.integer "genre_id"
    t.integer "video_games_id", null: false
    t.integer "genres_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genres_id"], name: "index_game_genres_on_genres_id"
    t.index ["video_games_id"], name: "index_game_genres_on_video_games_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "video_games", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "genre"
    t.integer "user_happiness_score"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_video_games_on_user_id"
  end

  add_foreign_key "game_genres", "genres", column: "genres_id"
  add_foreign_key "game_genres", "video_games", column: "video_games_id"
  add_foreign_key "video_games", "users"
end