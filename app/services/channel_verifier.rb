class ChannelVerifier
  MUSE_ASIA_CHANNEL_ID = "UCGbshtvS9t-8CW11W7TooQg".freeze
  MUSE_INDIA_CHANNEL_ID = "UCYYhAzgWuxPauRXdPpLAX3Q".freeze

  ALLOWED_CHANNELS = {
    MUSE_ASIA_CHANNEL_ID => {
      name: "Muse Asia",
      handle: "@MuseAsia",
      url: "https://www.youtube.com/@MuseAsia"
    },
    MUSE_INDIA_CHANNEL_ID => {
      name: "Muse India",
      handle: "@MuseIndiaChannel",
      url: "https://www.youtube.com/@MuseIndiaChannel"
    }
  }.freeze

  def self.allowed_channel_id?(channel_id)
    ALLOWED_CHANNELS.key?(channel_id.to_s.strip)
  end

  def self.channel_info(channel_id)
    ALLOWED_CHANNELS[channel_id.to_s.strip]
  end

  def self.allowed_channel_ids
    ALLOWED_CHANNELS.keys
  end

  def self.allowed_channel_names
    ALLOWED_CHANNELS.values.map { |c| c[:name] }
  end

  # Validates video ownership against official YouTube channel
  def self.verify_video_channel(video_id)
    vid = video_id.to_s.strip
    return { verified: false, error: "Invalid video ID format" } unless vid =~ /\A[a-zA-Z0-9_-]{11}\z/

    require "open-uri"
    require "json"

    oembed_url = "https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v=#{vid}&format=json"
    URI.open(oembed_url, "User-Agent" => "Mozilla/5.0", read_timeout: 4) do |resp|
      data = JSON.parse(resp.read)
      author_name = data["author_name"]
      author_url = data["author_url"]

      if author_url.to_s.include?("@MuseAsia") || author_name == "Muse Asia"
        { verified: true, channel_id: MUSE_ASIA_CHANNEL_ID, channel_name: "Muse Asia", channel_url: "https://www.youtube.com/@MuseAsia", title: data["title"] }
      elsif author_url.to_s.include?("@MuseIndiaChannel") || author_name == "Muse India"
        { verified: true, channel_id: MUSE_INDIA_CHANNEL_ID, channel_name: "Muse India", channel_url: "https://www.youtube.com/@MuseIndiaChannel", title: data["title"] }
      else
        { verified: false, error: "Unauthorized channel: #{author_name} (#{author_url})" }
      end
    end
  rescue StandardError => e
    { verified: false, error: e.message }
  end
end
