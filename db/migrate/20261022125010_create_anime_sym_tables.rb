class CreateAnimeSymTables < ActiveRecord::Migration[8.1]
  def change
    create_table :genres do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.text :description
      t.string :color, default: "purple"

      t.timestamps
    end
    add_index :genres, :slug, unique: true
    add_index :genres, :name

    create_table :animes do |t|
      t.string :title, null: false
      t.string :japanese_title
      t.string :slug, null: false
      t.text :synopsis, null: false
      t.decimal :rating, precision: 3, scale: 1, default: 0.0
      t.integer :release_year
      t.string :season
      t.string :status, default: "Completed"
      t.string :studio
      t.string :age_rating, default: "PG-13"
      t.string :duration_per_ep, default: "24 min"
      t.integer :total_episodes, default: 0
      t.string :poster_url, null: false
      t.string :banner_url, null: false
      t.string :trailer_youtube_id
      t.boolean :featured, default: false
      t.boolean :trending, default: false
      t.integer :popular_rank
      t.boolean :sub_available, default: true
      t.boolean :dub_available, default: true
      t.string :audio_languages, default: "Japanese, English"
      t.string :subtitle_languages, default: "English"
      t.integer :views_count, default: 0

      t.timestamps
    end
    add_index :animes, :slug, unique: true
    add_index :animes, :title
    add_index :animes, :rating
    add_index :animes, :featured
    add_index :animes, :trending
    add_index :animes, :release_year

    create_table :anime_genres do |t|
      t.references :anime, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
    add_index :anime_genres, [:anime_id, :genre_id], unique: true

    create_table :collections do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :description
      t.string :curator_note
      t.string :badge
      t.boolean :featured, default: false
      t.integer :position, default: 0

      t.timestamps
    end
    add_index :collections, :slug, unique: true

    create_table :collection_animes do |t|
      t.references :collection, null: false, foreign_key: true
      t.references :anime, null: false, foreign_key: true
      t.integer :position, default: 0

      t.timestamps
    end
    add_index :collection_animes, [:collection_id, :anime_id], unique: true

    create_table :episodes do |t|
      t.references :anime, null: false, foreign_key: true
      t.integer :episode_number, null: false
      t.string :title, null: false
      t.text :synopsis
      t.string :thumbnail_url
      t.string :duration, default: "24m"
      t.string :youtube_video_id, null: false
      t.string :official_playlist_url
      t.string :licensed_source, default: "Official Channel Broadcast"
      t.date :aired_at
      t.integer :views_count, default: 0

      t.timestamps
    end
    add_index :episodes, [:anime_id, :episode_number], unique: true

    create_table :episode_comments do |t|
      t.references :episode, null: false, foreign_key: true
      t.string :user_name, default: "AnimeFan"
      t.text :body, null: false
      t.string :reaction_type, default: "fire"

      t.timestamps
    end
  end
end
