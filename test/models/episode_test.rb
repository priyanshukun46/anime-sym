require "test_helper"

class EpisodeTest < ActiveSupport::TestCase
  setup do
    @anime = Anime.create!(
      title: "Heroic Chronicles",
      slug: "heroic-chronicles",
      synopsis: "The beginning of the legend.",
      poster_url: "https://example.com/poster.jpg",
      banner_url: "https://example.com/banner.jpg"
    )
    @ep1 = @anime.episodes.create!(
      episode_number: 1,
      title: "The Awakening",
      youtube_video_id: "h_tL16PZ0IE",
      channel_id: ChannelVerifier::MUSE_ASIA_CHANNEL_ID,
      channel_name: "Muse Asia",
      duration: "24m"
    )
    @ep2 = @anime.episodes.create!(
      episode_number: 2,
      title: "The Challenge",
      youtube_video_id: "sl8LwAqFOvo",
      channel_id: ChannelVerifier::MUSE_INDIA_CHANNEL_ID,
      channel_name: "Muse India",
      duration: "24m"
    )
  end

  test "validates uniqueness of episode_number scoped to anime" do
    dup_ep = @anime.episodes.build(
      episode_number: 1,
      title: "Duplicate",
      youtube_video_id: "NIgOI38wYzc",
      channel_id: ChannelVerifier::MUSE_ASIA_CHANNEL_ID
    )
    assert_not dup_ep.valid?
    assert_includes dup_ep.errors[:episode_number], "has already been taken"
  end

  test "validates channel belongs strictly to Muse Asia or Muse India" do
    invalid_ep = @anime.episodes.build(
      episode_number: 3,
      title: "Unauthorized Upload",
      youtube_video_id: "invalid1234",
      channel_id: "UC_random_unauthorized_channel",
      channel_name: "Random Pirate Channel"
    )
    assert_not invalid_ep.valid?
    assert_includes invalid_ep.errors[:channel_id], "must belong to official Muse Asia or Muse India channel"
  end

  test "determines next and previous episodes correctly" do
    assert_equal @ep2, @ep1.next_episode
    assert_nil @ep1.previous_episode

    assert_equal @ep1, @ep2.previous_episode
    assert_nil @ep2.next_episode
  end

  test "generates standard nocookie youtube embed url" do
    assert_includes @ep1.youtube_embed_url, "https://www.youtube-nocookie.com/embed/h_tL16PZ0IE"
    assert_includes @ep1.youtube_embed_url, "rel=0"
    assert_includes @ep1.youtube_embed_url, "modestbranding=1"
    assert_includes @ep1.youtube_embed_url, "playsinline=1"
  end
end
