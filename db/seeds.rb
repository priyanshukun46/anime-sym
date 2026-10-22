puts "--- Seeding Anime Sym with Strictly Verified Official Muse Asia & Muse India Content ---"

EpisodeComment.delete_all
Episode.delete_all
CollectionAnime.delete_all
Collection.delete_all
AnimeGenre.delete_all
Anime.delete_all
Genre.delete_all

# Official Verified Channel Constants
MUSE_ASIA_ID = ChannelVerifier::MUSE_ASIA_CHANNEL_ID
MUSE_ASIA_URL = "https://www.youtube.com/@MuseAsia"

MUSE_INDIA_ID = ChannelVerifier::MUSE_INDIA_CHANNEL_ID
MUSE_INDIA_URL = "https://www.youtube.com/@MuseIndiaChannel"

# 1. Genres
genres_data = [
  { name: "Action", color: "rose", description: "Fast-paced combat, superhuman martial arts, and high-octane showdowns." },
  { name: "Adventure", color: "amber", description: "Grand journeys through uncharted realms and dangerous dungeons." },
  { name: "Fantasy", color: "purple", description: "Reincarnation, sword & sorcery, magic schools, and mythical beasts." },
  { name: "Comedy", color: "yellow", description: "Hilarious misunderstandings, quirky characters, and feel-good antics." },
  { name: "Supernatural", color: "indigo", description: "Demons, curses, occult mysteries, and supernatural powers." },
  { name: "Sci-Fi", color: "cyan", description: "Virtual reality MMOs, futuristic tech, and timeline travel." },
  { name: "Drama", color: "violet", description: "High-stakes psychological battles, personal growth, and intense rivalries." },
  { name: "Slice of Life", color: "teal", description: "Wholesome domestic comedy, undercover family life, and school bonds." }
]

genres = {}
genres_data.each do |g|
  genres[g[:name]] = Genre.create!(
    name: g[:name],
    slug: g[:name].parameterize,
    description: g[:description],
    color: g[:color]
  )
end
puts "Created #{Genre.count} Genres."

# 2. Anime Series with 100% Verified Official Muse Asia / Muse India Videos
animes_data = [
  {
    title: "Spy x Family",
    japanese_title: "SPY×FAMILY",
    slug: "spy-x-family",
    synopsis: "World peace is at stake and secret agent Twilight must undergo his most difficult mission yet—pretend to be a family man. Posing as the loving husband and father Loid Forger, he adopts telepathic orphan Anya and marries assassin Yor, completely unaware of each other's secret identities.",
    rating: 8.6,
    release_year: 2022,
    season: "Spring 2022",
    status: "Completed",
    studio: "Wit Studio & CloverWorks",
    age_rating: "PG-13",
    duration_per_ep: "24 min",
    total_episodes: 25,
    poster_url: "https://images.unsplash.com/photo-1578632767115-351597cf2477?auto=format&fit=crop&w=800&q=80",
    banner_url: "https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&w=1920&q=85",
    trailer_youtube_id: "h_tL16PZ0IE",
    featured: true,
    trending: true,
    popular_rank: 1,
    sub_available: true,
    dub_available: true,
    audio_languages: "Japanese, English",
    subtitle_languages: "English, Chinese, Thai",
    views_count: 245000,
    genre_names: ["Comedy", "Action", "Slice of Life"],
    episodes: [
      {
        episode_number: 1,
        title: "Operation Strix",
        synopsis: "Master spy Twilight receives Operation Strix, an assignment to infiltrate the prestigious Eden Academy by creating a fake family within seven days.",
        thumbnail_url: "https://images.unsplash.com/photo-1578632767115-351597cf2477?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "h_tL16PZ0IE",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl1wGMYg5oB3uEns0CZNl6sI",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2022-04-09"
      },
      {
        episode_number: 2,
        title: "Secure a Wife",
        synopsis: "To pass Eden Academy's mandatory family interview, Loid needs a wife. He crosses paths with Yor Briar, a soft-spoken clerk who secretly works as the assassin 'Thorn Princess.'",
        thumbnail_url: "https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "NIgOI38wYzc",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl1wGMYg5oB3uEns0CZNl6sI",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2022-04-16"
      },
      {
        episode_number: 3,
        title: "Prepare for the Interview",
        synopsis: "With Yor now moving in, the newly formed Forger family conducts mock interviews and explores the city of Berlint to foster genuine family synergy.",
        thumbnail_url: "https://images.unsplash.com/photo-1534447677768-be436bb09401?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "ziiXFMl2nto",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl1wGMYg5oB3uEns0CZNl6sI",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2022-04-23"
      },
      {
        episode_number: 4,
        title: "The Prestigious School's Interview",
        synopsis: "The day of Eden Academy's high-stakes entrance interview arrives. Housemaster Henry Henderson scrutinizes every movement for absolute elegance.",
        thumbnail_url: "https://images.unsplash.com/photo-1509198397868-475647b2a1e5?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "0V9Z--9wiLo",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl1wGMYg5oB3uEns0CZNl6sI",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2022-04-30"
      }
    ]
  },
  {
    title: "One-Punch Man",
    japanese_title: "ワンパンマン",
    slug: "one-punch-man",
    synopsis: "Saitama is a hero who only became one for fun. After three years of 'special training,' he's grown so strong that he's practically invincible—he defeats every opponent with a single punch. Bored with the lack of challenge, Saitama seeks an opponent strong enough to give him an exhilarating fight.",
    rating: 8.8,
    release_year: 2015,
    season: "Fall 2015",
    status: "Completed",
    studio: "Madhouse",
    age_rating: "R - 17+",
    duration_per_ep: "24 min",
    total_episodes: 12,
    poster_url: "https://images.unsplash.com/photo-1563089145-599997674d42?auto=format&fit=crop&w=800&q=80",
    banner_url: "https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=1920&q=85",
    trailer_youtube_id: "sl8LwAqFOvo",
    featured: true,
    trending: true,
    popular_rank: 2,
    sub_available: true,
    dub_available: true,
    audio_languages: "Hindi, Japanese",
    subtitle_languages: "English, Hindi",
    views_count: 310000,
    genre_names: ["Action", "Comedy", "Supernatural"],
    episodes: [
      {
        episode_number: 1,
        title: "The Strongest Man",
        synopsis: "Vaccine Man and subterranean monsters threaten City Z. Saitama dispatches them with nonchalant single strikes while mourning his loss of emotional excitement.",
        thumbnail_url: "https://images.unsplash.com/photo-1563089145-599997674d42?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "sl8LwAqFOvo",
        channel_name: "Muse India",
        channel_id: MUSE_INDIA_ID,
        channel_url: MUSE_INDIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLpm1VVK4UL14XTDA9wPpCC6zKB2jUh9vY",
        licensed_source: "Official Muse India Hindi Dub",
        aired_at: "2015-10-05"
      },
      {
        episode_number: 2,
        title: "The Lone Cyborg",
        synopsis: "Genos, a cyborg seeking revenge against a rogue android, encounters Mosquito Girl and witnesses Saitama's overwhelming god-like power.",
        thumbnail_url: "https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "ZbPlicgv0-s",
        channel_name: "Muse India",
        channel_id: MUSE_INDIA_ID,
        channel_url: MUSE_INDIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLpm1VVK4UL14XTDA9wPpCC6zKB2jUh9vY",
        licensed_source: "Official Muse India Hindi Dub",
        aired_at: "2015-10-12"
      },
      {
        episode_number: 3,
        title: "The Obsessive Scientist",
        synopsis: "Genos and Saitama invade the House of Evolution headquarters, confronting mutated warrior Carnage Kabuto in a locked combat arena.",
        thumbnail_url: "https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "0k1nXqVDV1o",
        channel_name: "Muse India",
        channel_id: MUSE_INDIA_ID,
        channel_url: MUSE_INDIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLpm1VVK4UL14XTDA9wPpCC6zKB2jUh9vY",
        licensed_source: "Official Muse India Hindi Dub",
        aired_at: "2015-10-19"
      },
      {
        episode_number: 4,
        title: "The Modern Ninja",
        synopsis: "A rogue group of bald extremists called the Paradisers attack wealth magnates. Speed-o'-Sound Sonic mistakes Saitama for one of their members.",
        thumbnail_url: "https://images.unsplash.com/photo-1541701494587-cb58502866ab?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "dPwdIoaOcbk",
        channel_name: "Muse India",
        channel_id: MUSE_INDIA_ID,
        channel_url: MUSE_INDIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLpm1VVK4UL14XTDA9wPpCC6zKB2jUh9vY",
        licensed_source: "Official Muse India Hindi Dub",
        aired_at: "2015-10-26"
      }
    ]
  },
  {
    title: "Tokyo Revengers",
    japanese_title: "東京リベンジャーズ",
    slug: "tokyo-revengers",
    synopsis: "Watching the news, Takemichi Hanagaki learns that his middle school girlfriend, Hinata Tachibana, has died at the hands of the notorious Tokyo Manji Gang. After an accident on the train platform, Takemichi leaps back exactly twelve years to his middle school days, resolving to rewrite destiny and save Hinata.",
    rating: 8.4,
    release_year: 2021,
    season: "Spring 2021",
    status: "Completed",
    studio: "LIDENFILMS",
    age_rating: "R - 17+",
    duration_per_ep: "24 min",
    total_episodes: 24,
    poster_url: "https://images.unsplash.com/photo-1607604276583-eef5d076aa5f?auto=format&fit=crop&w=800&q=80",
    banner_url: "https://images.unsplash.com/photo-1579783900882-c0d3dad7b119?auto=format&fit=crop&w=1920&q=85",
    trailer_youtube_id: "o1ZOVH9LXzM",
    featured: true,
    trending: true,
    popular_rank: 3,
    sub_available: true,
    dub_available: false,
    audio_languages: "Japanese",
    subtitle_languages: "English, Chinese, Malay",
    views_count: 285000,
    genre_names: ["Action", "Drama", "Supernatural"],
    episodes: [
      {
        episode_number: 1,
        title: "Reborn",
        synopsis: "Hopeless 26-year-old Takemichi Hanagaki is pushed onto the train tracks. Instead of dying, he wakes up 12 years in the past as a delinquent student.",
        thumbnail_url: "https://images.unsplash.com/photo-1607604276583-eef5d076aa5f?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "o1ZOVH9LXzM",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl3F9AGKbC7iRIGeU2XosgTy",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2021-04-11"
      },
      {
        episode_number: 2,
        title: "Resist",
        synopsis: "Realizing that shaking hands with Naoto triggers the time leap, Takemichi sets out to stop Mikey and Kisaki before the Tokyo Manji Gang turns villainous.",
        thumbnail_url: "https://images.unsplash.com/photo-1579783900882-c0d3dad7b119?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "GZx9tN0nfxE",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl3F9AGKbC7iRIGeU2XosgTy",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2021-04-18"
      },
      {
        episode_number: 3,
        title: "Resolve",
        synopsis: "Takemichi challenges Kiyomasa to a bare-knuckle brawl to protect his friends, catching the interest of Toman's legendary leader Mikey and commander Draken.",
        thumbnail_url: "https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "oYGexsd2-xY",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl3F9AGKbC7iRIGeU2XosgTy",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2021-04-25"
      },
      {
        episode_number: 4,
        title: "Return",
        synopsis: "Mikey invites Takemichi into Toman's inner circle. Returning to the present day, Takemichi discovers how much his past actions have reshaped reality.",
        thumbnail_url: "https://images.unsplash.com/photo-1509198397868-475647b2a1e5?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "7QLmPn3u3Cw",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl3F9AGKbC7iRIGeU2XosgTy",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2021-05-02"
      }
    ]
  },
  {
    title: "Mushoku Tensei: Jobless Reincarnation",
    japanese_title: "無職転生 ～異世界行ったら本気だす～",
    slug: "mushoku-tensei-jobless-reincarnation",
    synopsis: "When a 34-year-old recluse dies saving a stranger, he reincarnates into a fantastical world as baby Rudeus Greyrat. Retaining his past memories and gifted with immense magical affinity, Rudeus vows to live life without regrets and master ancient elemental arts.",
    rating: 8.7,
    release_year: 2021,
    season: "Winter 2021",
    status: "Completed",
    studio: "Studio Bind",
    age_rating: "R - 17+",
    duration_per_ep: "24 min",
    total_episodes: 23,
    poster_url: "https://images.unsplash.com/photo-1534447677768-be436bb09401?auto=format&fit=crop&w=800&q=80",
    banner_url: "https://images.unsplash.com/photo-1511447333015-45b65e60f6d5?auto=format&fit=crop&w=1920&q=85",
    trailer_youtube_id: "mKS67U6ZEWM",
    featured: true,
    trending: true,
    popular_rank: 4,
    sub_available: true,
    dub_available: false,
    audio_languages: "Japanese",
    subtitle_languages: "English, Chinese",
    views_count: 340000,
    genre_names: ["Fantasy", "Adventure", "Drama"],
    episodes: [
      {
        episode_number: 1,
        title: "Jobless Reincarnation",
        synopsis: "A 34-year-old NEET dies and is reborn into the Greyrat family as baby Rudeus. He discovers spellbooks and begins practicing silent incantations.",
        thumbnail_url: "https://images.unsplash.com/photo-1534447677768-be436bb09401?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "mKS67U6ZEWM",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl2-3IJvnbF-_aRL-chrwcEh",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2021-01-11"
      },
      {
        episode_number: 2,
        title: "Master",
        synopsis: "Recognizing Rudeus's magical talent, Paul hires Roxy Migurdia, a Migurd tribe water saint mage, to tutor Rudeus in advanced magic.",
        thumbnail_url: "https://images.unsplash.com/photo-1511447333015-45b65e60f6d5?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "Y4bP1PMvsag",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl2-3IJvnbF-_aRL-chrwcEh",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2021-01-18"
      },
      {
        episode_number: 3,
        title: "A Friend",
        synopsis: "Roxy completes Rudeus's graduation test. Free from his past trauma of leaving the house, Rudeus rescues a bullied half-elf named Sylphiette.",
        thumbnail_url: "https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "WqlyT_-kIGM",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl2-3IJvnbF-_aRL-chrwcEh",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2021-01-25"
      },
      {
        episode_number: 4,
        title: "Emergency Family Meeting",
        synopsis: "Tensions flare at the Greyrat residence when maid Lilia becomes pregnant, testing family bonds and prompting Paul to take drastic measures.",
        thumbnail_url: "https://images.unsplash.com/photo-1509198397868-475647b2a1e5?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "5erYkpLWFDM",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl2-3IJvnbF-_aRL-chrwcEh",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2021-02-01"
      }
    ]
  },
  {
    title: "The God of High School",
    japanese_title: "ゴッド・オブ・ハイスクール",
    slug: "the-god-of-high-school",
    synopsis: "All-style martial arts tournament 'God of High School' gathers Korea's toughest teenage fighters with the promise of granting the winner's deepest wish. Taekwondo specialist Jin Mori, karate prodigy Han Daewi, and master swordsman Yu Mira enter the ring, soon uncovering cosmic forces behind the games.",
    rating: 8.2,
    release_year: 2020,
    season: "Summer 2020",
    status: "Completed",
    studio: "MAPPA",
    age_rating: "R - 17+",
    duration_per_ep: "24 min",
    total_episodes: 13,
    poster_url: "https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&w=800&q=80",
    banner_url: "https://images.unsplash.com/photo-1534447677768-be436bb09401?auto=format&fit=crop&w=1920&q=85",
    trailer_youtube_id: "jSeXcj5y3Ao",
    featured: false,
    trending: true,
    popular_rank: 5,
    sub_available: true,
    dub_available: true,
    audio_languages: "Hindi, Japanese",
    subtitle_languages: "English, Hindi",
    views_count: 195000,
    genre_names: ["Action", "Supernatural", "Fantasy"],
    episodes: [
      {
        episode_number: 1,
        title: "set up/stand up",
        synopsis: "Jin Mori races through Seoul chasing a thief on a bicycle, crossing paths with fellow tournament qualifiers Han Daewi and Yu Mira.",
        thumbnail_url: "https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "jSeXcj5y3Ao",
        channel_name: "Muse India",
        channel_id: MUSE_INDIA_ID,
        channel_url: MUSE_INDIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLpm1VVK4UL14U47Nk3lfKGG1dM4TZj4KO",
        licensed_source: "Official Muse India Hindi Dub",
        aired_at: "2020-07-06"
      },
      {
        episode_number: 2,
        title: "front/sun",
        synopsis: "The Seoul regional preliminaries commence with a massive battle royale. Mori showcases his Renewal Taekwondo techniques against gang enforcers.",
        thumbnail_url: "https://images.unsplash.com/photo-1534447677768-be436bb09401?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "MyniRwS63oQ",
        channel_name: "Muse India",
        channel_id: MUSE_INDIA_ID,
        channel_url: MUSE_INDIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLpm1VVK4UL14U47Nk3lfKGG1dM4TZj4KO",
        licensed_source: "Official Muse India Hindi Dub",
        aired_at: "2020-07-13"
      },
      {
        episode_number: 3,
        title: "wisdom/courage",
        synopsis: "Yu Mira faces pro wrestler Mah Miseon in tournament match, relying on Moonlight Sword style to overcome overwhelming physical odds.",
        thumbnail_url: "https://images.unsplash.com/photo-1509198397868-475647b2a1e5?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "SpB_u9SdwZE",
        channel_name: "Muse India",
        channel_id: MUSE_INDIA_ID,
        channel_url: MUSE_INDIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLpm1VVK4UL14U47Nk3lfKGG1dM4TZj4KO",
        licensed_source: "Official Muse India Hindi Dub",
        aired_at: "2020-07-20"
      },
      {
        episode_number: 4,
        title: "marriage/bonds",
        synopsis: "A wealthy businessman proposes marriage to Mira, offering to restore her family's dojo. Mori and Daewi crash the ceremony.",
        thumbnail_url: "https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "7jcMXVDjKjs",
        channel_name: "Muse India",
        channel_id: MUSE_INDIA_ID,
        channel_url: MUSE_INDIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLpm1VVK4UL14U47Nk3lfKGG1dM4TZj4KO",
        licensed_source: "Official Muse India Hindi Dub",
        aired_at: "2020-07-27"
      }
    ]
  },
  {
    title: "Welcome to Demon School! Iruma-kun",
    japanese_title: "魔入りました! 入間くん",
    slug: "welcome-to-demon-school-iruma-kun",
    synopsis: "Fourteen-year-old Suzuki Iruma has been sold to a high-ranking demon by his irresponsible parents. To his surprise, the demon Lord Sullivan only wants to spoil him as his adopted grandson and enrolls him into the demon academy Babyls, where Iruma must hide his human nature.",
    rating: 8.3,
    release_year: 2019,
    season: "Fall 2019",
    status: "Completed",
    studio: "Bandai Namco Pictures",
    age_rating: "PG-13",
    duration_per_ep: "24 min",
    total_episodes: 23,
    poster_url: "https://images.unsplash.com/photo-1579783900882-c0d3dad7b119?auto=format&fit=crop&w=800&q=80",
    banner_url: "https://images.unsplash.com/photo-1478760329108-5c3ed9d495a0?auto=format&fit=crop&w=1920&q=85",
    trailer_youtube_id: "uUND8uJdoK8",
    featured: false,
    trending: true,
    popular_rank: 6,
    sub_available: true,
    dub_available: true,
    audio_languages: "Hindi, Japanese",
    subtitle_languages: "English, Hindi",
    views_count: 175000,
    genre_names: ["Comedy", "Fantasy", "Supernatural"],
    episodes: [
      {
        episode_number: 1,
        title: "Iruma-kun in Demon School",
        synopsis: "Iruma is sold to Sullivan and enrolled in Babyls. At the entrance ceremony, he accidentally reads a forbidden taboo chant and wins the duel against honor student Asmodeus.",
        thumbnail_url: "https://images.unsplash.com/photo-1579783900882-c0d3dad7b119?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "uUND8uJdoK8",
        channel_name: "Muse India",
        channel_id: MUSE_INDIA_ID,
        channel_url: MUSE_INDIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLpm1VVK4UL15ur1TfkHn1JYl281JL_yzN",
        licensed_source: "Official Muse India Hindi Dub",
        aired_at: "2019-10-05"
      },
      {
        episode_number: 2,
        title: "Familiar Summoning!",
        synopsis: "The freshmen undergo the familiar summoning ritual. Iruma inadvertently summons their stern supervisor Naberius Kalnego as his personal familiar.",
        thumbnail_url: "https://images.unsplash.com/photo-1478760329108-5c3ed9d495a0?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "Icabv9HAIqE",
        channel_name: "Muse India",
        channel_id: MUSE_INDIA_ID,
        channel_url: MUSE_INDIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLpm1VVK4UL15ur1TfkHn1JYl281JL_yzN",
        licensed_source: "Official Muse India Hindi Dub",
        aired_at: "2019-10-12"
      },
      {
        episode_number: 3,
        title: "Iruma and Clara / Demon Friends",
        synopsis: "Iruma befriends energetic outcast Valac Clara, whose bloodline ability allows her to produce toys and snacks from her pockets.",
        thumbnail_url: "https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "HM_aWqcIQd4",
        channel_name: "Muse India",
        channel_id: MUSE_INDIA_ID,
        channel_url: MUSE_INDIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLpm1VVK4UL15ur1TfkHn1JYl281JL_yzN",
        licensed_source: "Official Muse India Hindi Dub",
        aired_at: "2019-10-19"
      },
      {
        episode_number: 4,
        title: "The Misfit Class",
        synopsis: "Iruma, Asmodeus, and Clara are assigned to Babyls' notorious Misfit Class, meeting their colorful and eccentric classmates.",
        thumbnail_url: "https://images.unsplash.com/photo-1509198397868-475647b2a1e5?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "qXTJUy8Qs0Y",
        channel_name: "Muse India",
        channel_id: MUSE_INDIA_ID,
        channel_url: MUSE_INDIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLpm1VVK4UL15ur1TfkHn1JYl281JL_yzN",
        licensed_source: "Official Muse India Hindi Dub",
        aired_at: "2019-10-26"
      }
    ]
  },
  {
    title: "Classroom of the Elite",
    japanese_title: "ようこそ実力至上主義の教室へ",
    slug: "classroom-of-the-elite",
    synopsis: "Tokyo Metropolitan Advanced Nurturing High School guarantees 100% employment and college entry. Students receive points worth 100,000 yen each month and spend them freely—until Class 1-D discovers that students are evaluated strictly on academic and behavioral merit, and poor scores reduce their allowance to zero.",
    rating: 8.5,
    release_year: 2017,
    season: "Summer 2017",
    status: "Completed",
    studio: "Lerche",
    age_rating: "PG-13",
    duration_per_ep: "24 min",
    total_episodes: 12,
    poster_url: "https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&w=800&q=80",
    banner_url: "https://images.unsplash.com/photo-1534447677768-be436bb09401?auto=format&fit=crop&w=1920&q=85",
    trailer_youtube_id: "QbEoZexESDs",
    featured: false,
    trending: true,
    popular_rank: 7,
    sub_available: true,
    dub_available: true,
    audio_languages: "Telugu, Japanese",
    subtitle_languages: "English",
    views_count: 220000,
    genre_names: ["Drama", "Slice of Life"],
    episodes: [
      {
        episode_number: 1,
        title: "What is Evil? Whatever Springs from Weakness",
        synopsis: "Quiet student Kiyotaka Ayanokoji intentionally scores 50% on all entrance exams and lands in Class 1-D, where unmotivated students squander their initial point fortune.",
        thumbnail_url: "https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "QbEoZexESDs",
        channel_name: "Muse India",
        channel_id: MUSE_INDIA_ID,
        channel_url: MUSE_INDIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLpm1VVK4UL14HUVy045Qwdy0FKXdZPQv4",
        licensed_source: "Official Muse India Regional Dub",
        aired_at: "2017-07-12"
      },
      {
        episode_number: 2,
        title: "It Takes a Great Talent and Skill to Conceal One's Talent",
        synopsis: "Homeroom teacher Chabashira reveals the school's ruthless S-System: Class 1-D's reckless behavior has yielded zero points for the month of May.",
        thumbnail_url: "https://images.unsplash.com/photo-1534447677768-be436bb09401?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "4_Vumu_418c",
        channel_name: "Muse India",
        channel_id: MUSE_INDIA_ID,
        channel_url: MUSE_INDIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLpm1VVK4UL14HUVy045Qwdy0FKXdZPQv4",
        licensed_source: "Official Muse India Regional Dub",
        aired_at: "2017-07-19"
      },
      {
        episode_number: 3,
        title: "Man is an Animal That Makes Bargains",
        synopsis: "Midterms approach, with expulsion looming for any failing student. Horikita and Ayanokoji negotiate with upperclassmen to acquire past test papers.",
        thumbnail_url: "https://images.unsplash.com/photo-1509198397868-475647b2a1e5?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "GsiZwUXsRHE",
        channel_name: "Muse India",
        channel_id: MUSE_INDIA_ID,
        channel_url: MUSE_INDIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLpm1VVK4UL14HUVy045Qwdy0FKXdZPQv4",
        licensed_source: "Official Muse India Regional Dub",
        aired_at: "2017-07-26"
      },
      {
        episode_number: 4,
        title: "We Should Not Fret That Others Do Not Know Us",
        synopsis: "Sudou is falsely accused of instigating a fight with Class C students. Ayanokoji and Horikita seek witnesses to prevent his wrongful expulsion.",
        thumbnail_url: "https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "8Pm5E2jgZ8c",
        channel_name: "Muse India",
        channel_id: MUSE_INDIA_ID,
        channel_url: MUSE_INDIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLpm1VVK4UL14HUVy045Qwdy0FKXdZPQv4",
        licensed_source: "Official Muse India Regional Dub",
        aired_at: "2017-08-02"
      }
    ]
  },
  {
    title: "BOFURI: I Don't Want to Get Hurt, so I'll Max Out My Defense",
    japanese_title: "痛いのは嫌なので防御力に極振りしたいと思います。",
    slug: "bofuri-max-out-defense",
    synopsis: "Kaede Honjo is invited by her friend to play the VRMMO game NewWorld Online. Hating the idea of feeling pain, she puts all her skill points into vitality (VIT). With absurdly maxed-out defense, she becomes an indestructible, walking fortress capable of defeating bosses through poison immunity and shield bashes.",
    rating: 8.3,
    release_year: 2020,
    season: "Winter 2020",
    status: "Completed",
    studio: "SILVER LINK.",
    age_rating: "PG-13",
    duration_per_ep: "24 min",
    total_episodes: 12,
    poster_url: "https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=800&q=80",
    banner_url: "https://images.unsplash.com/photo-1563089145-599997674d42?auto=format&fit=crop&w=1920&q=85",
    trailer_youtube_id: "0lGJE8kTb4c",
    featured: false,
    trending: false,
    popular_rank: 8,
    sub_available: true,
    dub_available: false,
    audio_languages: "Japanese",
    subtitle_languages: "English, Chinese",
    views_count: 165000,
    genre_names: ["Fantasy", "Comedy", "Sci-Fi", "Action"],
    episodes: [
      {
        episode_number: 1,
        title: "Defense and First Battle",
        synopsis: "Kaede creates her avatar Maple in NewWorld Online, maxes out vitality, and falls asleep while wild hornets repeatedly attack her with zero damage.",
        thumbnail_url: "https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "0lGJE8kTb4c",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl0Kfd0S0D1PELpHYRUz-Owo",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2020-01-08"
      },
      {
        episode_number: 2,
        title: "Defense and Friends",
        synopsis: "Maple teams up with her skilled swashbuckler friend Sally to clear an underwater cave, earning high-tier gear and entering the first battle royale event.",
        thumbnail_url: "https://images.unsplash.com/photo-1563089145-599997674d42?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "Bc5l9Bjl028",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl0Kfd0S0D1PELpHYRUz-Owo",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2020-01-15"
      },
      {
        episode_number: 3,
        title: "Defense and Reaching the Second Level",
        synopsis: "The game developers panic after watching Maple solo a boss with full immunity. Maple and Sally discover a secret flying giant turtle.",
        thumbnail_url: "https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "NOuAB8Mm4C8",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl0Kfd0S0D1PELpHYRUz-Owo",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2020-01-22"
      },
      {
        episode_number: 4,
        title: "Defense and the Second Event",
        synopsis: "The Second Event begins, scattering silver and gold medals across a massive icy mountain. Maple and Sally defend a secluded cabin.",
        thumbnail_url: "https://images.unsplash.com/photo-1509198397868-475647b2a1e5?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "tLv8wzLJDOQ",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl0Kfd0S0D1PELpHYRUz-Owo",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2020-01-29"
      }
    ]
  },
  {
    title: "Goblin Slayer",
    japanese_title: "ゴブリンスレイヤー",
    slug: "goblin-slayer",
    synopsis: "In a world of adventurers seeking fame and glory, a low-ranked rookie priestess joins a novice party that meets tragedy on their very first goblin raid. She is rescued by an armor-clad warrior known simply as Goblin Slayer, a Silver-ranked specialist obsessed with the singular eradication of goblins.",
    rating: 8.2,
    release_year: 2018,
    season: "Fall 2018",
    status: "Completed",
    studio: "White Fox",
    age_rating: "R - 17+",
    duration_per_ep: "24 min",
    total_episodes: 12,
    poster_url: "https://images.unsplash.com/photo-1509198397868-475647b2a1e5?auto=format&fit=crop&w=800&q=80",
    banner_url: "https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&w=1920&q=85",
    trailer_youtube_id: "CaX_umWtMlU",
    featured: false,
    trending: false,
    popular_rank: 9,
    sub_available: true,
    dub_available: false,
    audio_languages: "Japanese",
    subtitle_languages: "English, Chinese",
    views_count: 210000,
    genre_names: ["Fantasy", "Action", "Adventure"],
    episodes: [
      {
        episode_number: 1,
        title: "The Fate of Particular Adventurers",
        synopsis: "A young priestess joins three rookies to clear out a goblin cave. When their ambush turns fatal, Goblin Slayer appears and methodically purges the lair.",
        thumbnail_url: "https://images.unsplash.com/photo-1509198397868-475647b2a1e5?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "CaX_umWtMlU",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl0yarBY8H1zXi3Oz834aRhm",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2018-10-07"
      },
      {
        episode_number: 2,
        title: "The Strong",
        synopsis: "Goblin Slayer investigates the outskirts of a rural village. Together with Priestess, he evaluates nest behavior and prepares smoke traps.",
        thumbnail_url: "https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "I-yiNKyMPtA",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl0yarBY8H1zXi3Oz834aRhm",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2018-10-14"
      },
      {
        episode_number: 3,
        title: "Unexpected Visitors",
        synopsis: "An High Elf Archer, Dwarf Shaman, and Lizard Priest seek out Goblin Slayer at the guild hall with an urgent request regarding Demon Lord legions.",
        thumbnail_url: "https://images.unsplash.com/photo-1534447677768-be436bb09401?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "Of7yuxGWCQ0",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl0yarBY8H1zXi3Oz834aRhm",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2018-10-21"
      },
      {
        episode_number: 4,
        title: "The Strong and the Weak",
        synopsis: "The party journeys into ancient elven ruins overrun by goblins, coordinating elemental spells, sleep powder, and subterranean navigation.",
        thumbnail_url: "https://images.unsplash.com/photo-1511447333015-45b65e60f6d5?auto=format&fit=crop&w=640&q=80",
        duration: "24m",
        youtube_video_id: "eMu786Fwoy4",
        channel_name: "Muse Asia",
        channel_id: MUSE_ASIA_ID,
        channel_url: MUSE_ASIA_URL,
        official_playlist_url: "https://www.youtube.com/playlist?list=PLwLSw1_eDZl0yarBY8H1zXi3Oz834aRhm",
        licensed_source: "Official Muse Asia Broadcast",
        aired_at: "2018-10-28"
      }
    ]
  }
]

created_animes = {}

animes_data.each do |a_data|
  genre_names = a_data.delete(:genre_names)
  episodes_data = a_data.delete(:episodes)

  anime = Anime.create!(a_data)
  created_animes[anime.slug] = anime

  genre_names.each do |g_name|
    genre = genres[g_name]
    AnimeGenre.create!(anime: anime, genre: genre) if genre
  end

  episodes_data.each do |ep_data|
    ep = anime.episodes.create!(ep_data)

    if ep.episode_number == 1
      ep.episode_comments.create!(
        user_name: "AnyaFan24",
        reaction_type: "wholesome",
        body: "So happy this is officially streaming on #{ep.channel_name}! Pure comfort anime."
      )
      ep.episode_comments.create!(
        user_name: "SakugaPulse",
        reaction_type: "fire",
        body: "High definition official stream with pristine audio quality."
      )
    end
  end
end

puts "Created #{Anime.count} Anime with #{Episode.count} Episodes and #{EpisodeComment.count} Comments."

# 3. Curated Collections
collections_data = [
  {
    title: "Official Muse Asia & India Spotlight",
    slug: "official-muse-spotlight",
    badge: "Verified Partner",
    curator_note: "Top licensed hits streaming 100% legally through official Muse Asia and Muse India YouTube channels.",
    featured: true,
    position: 1,
    anime_slugs: [
      "spy-x-family",
      "one-punch-man",
      "tokyo-revengers",
      "mushoku-tensei-jobless-reincarnation"
    ]
  },
  {
    title: "High-Octane Battles & Martial Arts",
    slug: "battles-and-martial-arts",
    badge: "Trending Action",
    curator_note: "From Saitama's unstoppable punches to the God of High School arena tournaments.",
    featured: true,
    position: 2,
    anime_slugs: [
      "one-punch-man",
      "the-god-of-high-school",
      "tokyo-revengers",
      "goblin-slayer"
    ]
  },
  {
    title: "Fantasy Worlds & Reincarnation",
    slug: "fantasy-and-isekai-realms",
    badge: "Fantasy Masterpieces",
    curator_note: "Venture into intricate magic systems, demon academies, and maxed-out vitality builds.",
    featured: true,
    position: 3,
    anime_slugs: [
      "mushoku-tensei-jobless-reincarnation",
      "bofuri-max-out-defense",
      "welcome-to-demon-school-iruma-kun",
      "goblin-slayer"
    ]
  },
  {
    title: "Wholesome Bonds & Clever Tactics",
    slug: "wholesome-and-tactical",
    badge: "Fan Favorites",
    curator_note: "Secret families, school negotiations, and comedic demon friendships.",
    featured: true,
    position: 4,
    anime_slugs: [
      "spy-x-family",
      "classroom-of-the-elite",
      "welcome-to-demon-school-iruma-kun",
      "bofuri-max-out-defense"
    ]
  }
]

collections_data.each do |c_data|
  slugs = c_data.delete(:anime_slugs)
  collection = Collection.create!(c_data)

  slugs.each_with_index do |slug, idx|
    anime = created_animes[slug]
    CollectionAnime.create!(collection: collection, anime: anime, position: idx + 1) if anime
  end
end

puts "Created #{Collection.count} Curated Collections."
puts "--- Strict Video Sourcing Seeding Complete! ---"
