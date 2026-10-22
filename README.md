# ⚡ Anime Sym - Official Anime Discovery & Streaming MVP

**Anime Sym** is a high-performance, legal anime discovery and streaming web platform MVP built with **Ruby on Rails 8**, **Hotwire (Turbo + Stimulus)**, **Tailwind CSS**, and **PostgreSQL**.

Designed with a cinematic dark aesthetic, dramatic visuals, subtle purple neon accents, and responsive layouts across desktop and mobile devices.

---

## 🌟 Key Features

1. **Cinematic Hero & Discovery Hub (Homepage)**
   - Dynamic hero showcase featuring high-res key visuals, Japanese & English typography, age ratings, genres, and instant watch actions.
   - Live trailer lightbox modal powered by Stimulus.
   - Ranked Trending carousel with live popularity badges (#1, #2, #3...).
   - Curated Editorial Collections preview.
   - Quick genre navigation ticker and trust indicators (100% Legal & Authorized Streams).

2. **Real-time Catalog & Advanced Discovery**
   - Instant live search with debounced typing suggestions dropdown.
   - Multi-parameter filtering:
     - **Genre filter** (Action, Adventure, Fantasy, Supernatural, Sci-Fi, Shonen, Drama, Mystery, Comedy, Slice of Life)
     - **Audio & Subtitle format filter** (Subtitled, English Dubbed, Dual Audio)
     - **Release status filter** (All, Completed, Currently Airing)
     - **Sorting** (Trending Popularity, Highest Rated, Newest, Title A-Z, Most Episodes)
   - Powered by Hotwire Turbo Frames for zero-page-reload filter updates.

3. **Anime Detail Pages**
   - Full-bleed cinematic backdrops with dark vignetting and glowing artwork.
   - Complete series metadata (Studio, Broadcast Season, Episode Duration, Original Japanese Title).
   - Episode guide with thumbnails, duration, air dates, and watched indicators.
   - Interactive Watchlist toggle with Turbo Streams.
   - Intelligent recommendations engine based on shared genres.

4. **Dedicated Episode Streaming Interface**
   - Responsive 16:9 official YouTube embeds (using `youtube-nocookie.com`).
   - Official publisher playlist integration buttons.
   - Player control strip: Next Episode, Previous Episode, Episode counter.
   - Interactive **Mark as Watched** progress tracker.
   - **Theater Mode** toggle expanding video full-width with ambient lighting.
   - One-click **Copy Share Link** with animated toast confirmation.
   - Scrollable Episode Selector sidebar.
   - Real-time community reactions feed (🔥 Fire, ⚡ Hype, 😭 Emotional, 🤯 Mind Blown, 💖 Wholesome) updated via Turbo Streams.

5. **Personal Watchlist ("My List")**
   - Instant bookmarking from cards, hero spotlight, or detail pages.
   - Live Turbo Stream count badge in the sticky navbar.
   - Dedicated management view with instant removal.

## 🛡️ Strict Video Source Policy & In-App Playback

Anime Sym enforces a strict, zero-piracy video sourcing policy:
- **Exclusive Authorized Channels:** Only videos published by **Muse Asia** (`UCGbshtvS9t-8CW11W7TooQg`) and **Muse India** (`UCYYhAzgWuxPauRXdPpLAX3Q`) are permitted.
- **Channel ID & Source Verification:** Every episode record stores `channel_name`, `channel_id`, `channel_url`, and `verified_source`. ActiveRecord validations strictly reject any episode not belonging to these verified channel IDs.
- **Catalog Filtering:** Any anime without verified official episodes from Muse Asia or Muse India is automatically excluded from the catalog.
- **In-App Streaming:** Clicking any episode navigates to the internal Anime Sym watch view (`/anime/:anime_id/episodes/:id`). The video is rendered via YouTube's official NOCookie iframe (`https://www.youtube-nocookie.com/embed/VIDEO_ID`), retaining full site navigation, episode drawer, and controls without external redirects.
- **Playback Restriction Handling:** If embedding is disabled or regional geoblocking restricts playback, an in-player notification and verified source fallback link are provided.

---

## 🛠️ Tech Stack

- **Framework**: Ruby on Rails 8.1.4
- **Language**: Ruby 3.4.6
- **Database**: PostgreSQL 18
- **Frontend Interactivity**: Hotwire (Turbo 8 + Stimulus JS)
- **Styling**: Tailwind CSS v4 (`tailwindcss-rails`)
- **Asset Pipeline**: Propshaft + Importmaps
- **Test Framework**: Minitest (`rails test`)

---

## 🚀 Getting Started Locally

### 1. Prerequisites
Ensure you have installed:
- Ruby `>= 3.2` (tested on Ruby `3.4.6`)
- PostgreSQL (`psql`)
- Bundler

### 2. Clone & Install Dependencies
```bash
cd "Anime sym"
bundle install
```

### 3. Setup Database & Seed Data
```bash
# Create database
bin/rails db:create

# Run migrations
bin/rails db:migrate

# Populate 12 anime series, 31 episodes, 10 genres, and 4 curated collections
bin/rails db:seed
```

### 4. Compile Tailwind CSS
```bash
bin/rails tailwindcss:build
```

### 5. Start the Application
Run both the Puma web server and the Tailwind CSS file watcher:
```bash
bin/dev
```
Or start the server directly:
```bash
bin/rails server
```
Then visit **`http://localhost:3000`** in your browser.

---

## 🧪 Running Automated Tests

Run the complete test suite (27 tests, 128 assertions):
```bash
bin/rails test
```

All tests execute against models, controllers, filters, search, and Turbo Stream interactions with 100% pass rate.
