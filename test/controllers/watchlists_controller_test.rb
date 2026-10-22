require "test_helper"

class WatchlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anime = Anime.create!(
      title: "Solo Warrior",
      slug: "solo-warrior",
      synopsis: "Leveling up alone.",
      poster_url: "https://example.com/poster.jpg",
      banner_url: "https://example.com/banner.jpg"
    )
    @anime.episodes.create!(
      episode_number: 1,
      title: "Solo Awakening",
      youtube_video_id: "h_tL16PZ0IE",
      channel_id: ChannelVerifier::MUSE_ASIA_CHANNEL_ID,
      channel_name: "Muse Asia",
      duration: "24m"
    )
  end

  test "should get watchlist page" do
    get watchlist_url
    assert_response :success
  end

  test "should toggle anime in watchlist" do
    post toggle_watchlist_url, params: { anime_id: @anime.id }
    assert_redirected_to root_url
    follow_redirect!
    assert_includes response.body, "Added to your watchlist"

    # Toggle again to remove
    post toggle_watchlist_url, params: { anime_id: @anime.id }
    assert_redirected_to root_url
    follow_redirect!
    assert_includes response.body, "Removed from your watchlist"
  end

  test "should toggle anime in watchlist via turbo stream" do
    post toggle_watchlist_url, params: { anime_id: @anime.id }, as: :turbo_stream
    assert_response :success
    assert_equal "text/vnd.turbo-stream.html; charset=utf-8", response.content_type
    assert_includes response.body, %(action="update" target="watchlist_badge")
    assert_includes response.body, %(action="replace" target="watchlist_toggle_#{@anime.id}")
  end
end
