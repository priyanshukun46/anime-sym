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

ActiveRecord::Schema[8.1].define(version: 2026_10_22_132232) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "anime_genres", force: :cascade do |t|
    t.bigint "anime_id", null: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anime_id", "genre_id"], name: "index_anime_genres_on_anime_id_and_genre_id", unique: true
    t.index ["anime_id"], name: "index_anime_genres_on_anime_id"
    t.index ["genre_id"], name: "index_anime_genres_on_genre_id"
  end

  create_table "animes", force: :cascade do |t|
    t.string "title", null: false
    t.string "japanese_title"
    t.string "slug", null: false
    t.text "synopsis", null: false
    t.decimal "rating", precision: 3, scale: 1, default: "0.0"
    t.integer "release_year"
    t.string "season"
    t.string "status", default: "Completed"
    t.string "studio"
    t.string "age_rating", default: "PG-13"
    t.string "duration_per_ep", default: "24 min"
    t.integer "total_episodes", default: 0
    t.string "poster_url", null: false
    t.string "banner_url", null: false
    t.string "trailer_youtube_id"
    t.boolean "featured", default: false
    t.boolean "trending", default: false
    t.integer "popular_rank"
    t.boolean "sub_available", default: true
    t.boolean "dub_available", default: true
    t.string "audio_languages", default: "Japanese, English"
    t.string "subtitle_languages", default: "English"
    t.integer "views_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["featured"], name: "index_animes_on_featured"
    t.index ["rating"], name: "index_animes_on_rating"
    t.index ["release_year"], name: "index_animes_on_release_year"
    t.index ["slug"], name: "index_animes_on_slug", unique: true
    t.index ["title"], name: "index_animes_on_title"
    t.index ["trending"], name: "index_animes_on_trending"
  end

  create_table "collection_animes", force: :cascade do |t|
    t.bigint "collection_id", null: false
    t.bigint "anime_id", null: false
    t.integer "position", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anime_id"], name: "index_collection_animes_on_anime_id"
    t.index ["collection_id", "anime_id"], name: "index_collection_animes_on_collection_id_and_anime_id", unique: true
    t.index ["collection_id"], name: "index_collection_animes_on_collection_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "title", null: false
    t.string "slug", null: false
    t.text "description"
    t.string "curator_note"
    t.string "badge"
    t.boolean "featured", default: false
    t.integer "position", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_collections_on_slug", unique: true
  end

  create_table "episode_comments", force: :cascade do |t|
    t.bigint "episode_id", null: false
    t.string "user_name", default: "AnimeFan"
    t.text "body", null: false
    t.string "reaction_type", default: "fire"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["episode_id"], name: "index_episode_comments_on_episode_id"
  end

  create_table "episodes", force: :cascade do |t|
    t.bigint "anime_id", null: false
    t.integer "episode_number", null: false
    t.string "title", null: false
    t.text "synopsis"
    t.string "thumbnail_url"
    t.string "duration", default: "24m"
    t.string "youtube_video_id", null: false
    t.string "official_playlist_url"
    t.string "licensed_source", default: "Official Channel Broadcast"
    t.date "aired_at"
    t.integer "views_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "channel_name", default: "Muse Asia", null: false
    t.string "channel_id", default: "UCGbshtvS9t-8CW11W7TooQg", null: false
    t.string "channel_url", default: "https://www.youtube.com/@MuseAsia", null: false
    t.boolean "verified_source", default: true, null: false
    t.index ["anime_id", "episode_number"], name: "index_episodes_on_anime_id_and_episode_number", unique: true
    t.index ["anime_id"], name: "index_episodes_on_anime_id"
    t.index ["channel_id"], name: "index_episodes_on_channel_id"
    t.index ["verified_source"], name: "index_episodes_on_verified_source"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.text "description"
    t.string "color", default: "purple"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_genres_on_name"
    t.index ["slug"], name: "index_genres_on_slug", unique: true
  end

  add_foreign_key "anime_genres", "animes"
  add_foreign_key "anime_genres", "genres"
  add_foreign_key "collection_animes", "animes"
  add_foreign_key "collection_animes", "collections"
  add_foreign_key "episode_comments", "episodes"
  add_foreign_key "episodes", "animes"
end
