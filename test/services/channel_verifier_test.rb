require "test_helper"

class ChannelVerifierTest < ActiveSupport::TestCase
  test "identifies official Muse Asia channel id as allowed" do
    assert ChannelVerifier.allowed_channel_id?(ChannelVerifier::MUSE_ASIA_CHANNEL_ID)
    info = ChannelVerifier.channel_info(ChannelVerifier::MUSE_ASIA_CHANNEL_ID)
    assert_equal "Muse Asia", info[:name]
    assert_equal "https://www.youtube.com/@MuseAsia", info[:url]
  end

  test "identifies official Muse India channel id as allowed" do
    assert ChannelVerifier.allowed_channel_id?(ChannelVerifier::MUSE_INDIA_CHANNEL_ID)
    info = ChannelVerifier.channel_info(ChannelVerifier::MUSE_INDIA_CHANNEL_ID)
    assert_equal "Muse India", info[:name]
    assert_equal "https://www.youtube.com/@MuseIndiaChannel", info[:url]
  end

  test "rejects unauthorized random channel ids" do
    assert_not ChannelVerifier.allowed_channel_id?("UC_fake_pirated_channel_12345")
    assert_not ChannelVerifier.allowed_channel_id?("")
    assert_not ChannelVerifier.allowed_channel_id?(nil)
  end

  test "verifies video ownership returns valid format" do
    res = ChannelVerifier.verify_video_channel("invalid_id")
    assert_equal false, res[:verified]
  end
end
