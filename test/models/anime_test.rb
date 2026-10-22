require "test_helper"

class AnimeTest < ActiveSupport::TestCase
  setup do
    @genre = Genre.create!(name: "Fantasy", slug: "fantasy")
    @anime = Anime.create!(
      title: "Test Anime Odyssey",
      japanese_title: "テスト",
      slug: "test-anime-odyssey",
      synopsis: "A heroic journey across enchanted lands.",
      rating: 9.0,
      release_year: 2024,
      season: "Fall 2024",
      status: "Completed",
      studio: "Test Studio",
      poster_url: "https://example.com/poster.jpg",
      banner_url: "https://example.com/banner.jpg",
      trailer_youtube_id: "test12345",
      sub_available: true,
      dub_available: true
    )
    @anime.genres << @genre
  end

  test "validates presence of title, synopsis, poster_url and banner_url" do
    invalid_anime = Anime.new
    assert_not invalid_anime.valid?
    assert_includes invalid_anime.errors[:title], "can't be blank"
    assert_includes invalid_anime.errors[:synopsis], "can't be blank"
    assert_includes invalid_anime.errors[:poster_url], "can't be blank"
    assert_includes invalid_anime.errors[:banner_url], "can't be blank"
  end

  test "auto-generates slug from title if blank" do
    anime = Anime.create!(
      title: "Neon Cyber Runner",
      synopsis: "High speed hacking in future Tokyo.",
      poster_url: "https://example.com/poster.jpg",
      banner_url: "https://example.com/banner.jpg"
    )
    assert_equal "neon-cyber-runner", anime.slug
    assert_equal "neon-cyber-runner", anime.to_param
  end

  test "search scope filters by title or studio" do
    results = Anime.search_text("Odyssey")
    assert_includes results, @anime

    studio_results = Anime.search_text("Test Studio")
    assert_includes studio_results, @anime

    no_results = Anime.search_text("NonexistentXYZ")
    assert_empty no_results
  end

  test "genre filter scope finds anime by genre slug" do
    assert_includes Anime.filter_by_genre("fantasy"), @anime
    assert_empty Anime.filter_by_genre("non-existent-genre")
  end

  test "audio filter scope filters by sub or dub" do
    assert_includes Anime.filter_by_audio("sub"), @anime
    assert_includes Anime.filter_by_audio("dub"), @anime
    assert_includes Anime.filter_by_audio("dual"), @anime
  end

  test "verified_catalog scope only includes anime with verified Muse episodes" do
    # @anime has no episodes yet
    assert_not_includes Anime.verified_catalog, @anime

    # Add verified episode
    @anime.episodes.create!(
      episode_number: 1,
      title: "Ep 1",
      youtube_video_id: "h_tL16PZ0IE",
      channel_id: ChannelVerifier::MUSE_ASIA_CHANNEL_ID,
      channel_name: "Muse Asia",
      duration: "24m",
      verified_source: true
    )
    assert_includes Anime.verified_catalog, @anime
  end
end
