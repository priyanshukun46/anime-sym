require "test_helper"

class EpisodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anime = Anime.create!(
      title: "Sorcerer Chronicles",
      slug: "sorcerer-chronicles",
      synopsis: "Magical warfare.",
      poster_url: "https://example.com/poster.jpg",
      banner_url: "https://example.com/banner.jpg"
    )
    @ep1 = @anime.episodes.create!(
      episode_number: 1,
      title: "First Encounter",
      youtube_video_id: "h_tL16PZ0IE",
      channel_id: ChannelVerifier::MUSE_ASIA_CHANNEL_ID,
      channel_name: "Muse Asia",
      duration: "24m",
      synopsis: "The adventure begins."
    )
  end

  test "should show episode streaming page with embedded youtube player inside Anime Sym" do
    get anime_episode_url(@anime, @ep1)
    assert_response :success
    assert_includes response.body, "First Encounter"
    assert_includes response.body, "https://www.youtube-nocookie.com/embed/h_tL16PZ0IE"
    assert_includes response.body, "Verified Licensor: Muse Asia"
    assert_includes response.body, "Channel ID: #{ChannelVerifier::MUSE_ASIA_CHANNEL_ID}"
    # Verify player is embedded directly in Anime Sym layout, retaining navigation
    assert_select "header", text: /ANIMESYM/
    assert_select "iframe#anime_sym_yt_player"
  end

  test "should render fallback helper and official source links for regional restrictions" do
    get anime_episode_url(@anime, @ep1)
    assert_response :success
    assert_includes response.body, "Playback Unavailable in Embedded Player"
    assert_includes response.body, "https://www.youtube.com/watch?v=h_tL16PZ0IE"
    assert_includes response.body, "https://www.youtube.com/@MuseAsia"
  end

  test "should allow marking episode as watched" do
    get anime_episode_url(@anime, @ep1, mark_watched: "true")
    assert_response :success
    assert_includes response.body, "Watched"
  end

  test "should post comment on episode" do
    assert_difference -> { @ep1.episode_comments.count }, 1 do
      post anime_episode_comments_url(@anime, @ep1), params: {
        episode_comment: {
          user_name: "GojoFan",
          body: "Insane animation quality!",
          reaction_type: "fire"
        }
      }
    end
    assert_redirected_to anime_episode_url(@anime, @ep1)
  end

  test "should post comment on episode via turbo stream" do
    assert_difference -> { @ep1.episode_comments.count }, 1 do
      post anime_episode_comments_url(@anime, @ep1), params: {
        episode_comment: {
          user_name: "AnimeLover",
          body: "What a climax to this arc!",
          reaction_type: "hype"
        }
      }, as: :turbo_stream
    end
    assert_response :success
    assert_equal "text/vnd.turbo-stream.html; charset=utf-8", response.content_type
    assert_includes response.body, %(action="prepend" target="episode_comments_list")
    assert_includes response.body, "What a climax to this arc!"
  end
end
