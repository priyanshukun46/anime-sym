require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anime = Anime.create!(
      title: "Heroic Odyssey",
      slug: "heroic-odyssey",
      synopsis: "An epic adventure.",
      poster_url: "https://example.com/poster.jpg",
      banner_url: "https://example.com/banner.jpg",
      featured: true,
      trending: true,
      rating: 9.2
    )
    @anime.episodes.create!(
      episode_number: 1,
      title: "Heroic Prologue",
      youtube_video_id: "h_tL16PZ0IE",
      channel_id: ChannelVerifier::MUSE_ASIA_CHANNEL_ID,
      channel_name: "Muse Asia",
      duration: "24m"
    )
  end

  test "should get root homepage" do
    get root_url
    assert_response :success
    assert_select "header", text: /ANIMESYM/
    assert_includes response.body, "Heroic Odyssey"
    assert_includes response.body, "Trending Anime Right Now"
  end
end
