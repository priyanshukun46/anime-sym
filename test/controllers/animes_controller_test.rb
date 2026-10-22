require "test_helper"

class AnimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @genre = Genre.create!(name: "Supernatural", slug: "supernatural")
    @anime1 = Anime.create!(
      title: "Cursed Realm",
      slug: "cursed-realm",
      synopsis: "Sorcerers battling ancient curses.",
      poster_url: "https://example.com/poster1.jpg",
      banner_url: "https://example.com/banner1.jpg",
      rating: 8.8,
      status: "Completed",
      sub_available: true,
      dub_available: false
    )
    @anime1.genres << @genre

    @anime2 = Anime.create!(
      title: "Cyber City 2099",
      slug: "cyber-city-2099",
      synopsis: "Androids in neon shadows.",
      poster_url: "https://example.com/poster2.jpg",
      banner_url: "https://example.com/banner2.jpg",
      rating: 8.2,
      status: "Airing",
      sub_available: true,
      dub_available: true
    )

    @anime1.episodes.create!(
      episode_number: 1,
      title: "Cursed Awakening",
      youtube_video_id: "h_tL16PZ0IE",
      channel_id: ChannelVerifier::MUSE_ASIA_CHANNEL_ID,
      channel_name: "Muse Asia",
      duration: "24m"
    )

    @anime2.episodes.create!(
      episode_number: 1,
      title: "Neon Pulse",
      youtube_video_id: "sl8LwAqFOvo",
      channel_id: ChannelVerifier::MUSE_INDIA_CHANNEL_ID,
      channel_name: "Muse India",
      duration: "24m"
    )
  end

  test "should get catalog index" do
    get catalog_url
    assert_response :success
    assert_includes response.body, "Cursed Realm"
    assert_includes response.body, "Cyber City 2099"
  end

  test "should filter catalog by search query" do
    get catalog_url, params: { q: "Cyber" }
    assert_response :success
    assert_includes response.body, "Cyber City 2099"
    assert_not_includes response.body, "Cursed Realm"
  end

  test "should filter catalog by genre" do
    get catalog_url, params: { genre: "supernatural" }
    assert_response :success
    assert_includes response.body, "Cursed Realm"
    assert_not_includes response.body, "Cyber City 2099"
  end

  test "should filter catalog by audio" do
    get catalog_url, params: { audio: "dub" }
    assert_response :success
    assert_includes response.body, "Cyber City 2099"
    assert_not_includes response.body, "Cursed Realm"
  end

  test "should show anime detail page" do
    get anime_url(@anime1)
    assert_response :success
    assert_includes response.body, "Cursed Realm"
    assert_includes response.body, "Supernatural"
  end

  test "should return search suggestions" do
    get search_suggestions_url, params: { q: "Cursed" }
    assert_response :success
    assert_includes response.body, "Cursed Realm"
  end

  test "should exclude anime without verified episodes from catalog" do
    unverified = Anime.create!(
      title: "Unlicensed Mirror",
      slug: "unlicensed-mirror",
      synopsis: "Not licensed on official Muse channels.",
      poster_url: "https://example.com/poster3.jpg",
      banner_url: "https://example.com/banner3.jpg"
    )

    get catalog_url
    assert_response :success
    assert_not_includes response.body, "Unlicensed Mirror"

    get anime_url(unverified)
    assert_redirected_to catalog_url
    follow_redirect!
    assert_includes response.body, "not currently available from official verified sources"
  end
end
