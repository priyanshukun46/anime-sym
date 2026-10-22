class Episode < ApplicationRecord
  belongs_to :anime
  has_many :episode_comments, -> { order(created_at: :desc) }, dependent: :destroy

  before_validation :assign_channel_metadata

  validates :episode_number, presence: true, uniqueness: { scope: :anime_id }
  validates :title, presence: true
  validates :youtube_video_id, presence: true, format: {
    with: /\A[a-zA-Z0-9_-]{11}\z/,
    message: "must be a valid 11-character YouTube video ID"
  }
  validates :channel_id, presence: true, inclusion: {
    in: ChannelVerifier.allowed_channel_ids,
    message: "must belong to official Muse Asia or Muse India channel"
  }
  validates :channel_name, presence: true, inclusion: {
    in: ChannelVerifier.allowed_channel_names,
    message: "must be Muse Asia or Muse India"
  }
  validates :verified_source, inclusion: { in: [true], message: "must be verified as an official Muse source" }

  scope :verified_only, -> { where(verified_source: true, channel_id: ChannelVerifier.allowed_channel_ids) }

  def to_param
    episode_number.to_s
  end

  def next_episode
    anime.episodes.where("episode_number > ?", episode_number).order(episode_number: :asc).first
  end

  def previous_episode
    anime.episodes.where("episode_number < ?", episode_number).order(episode_number: :desc).first
  end

  def youtube_embed_url(autoplay: false)
    params = [
      "rel=0",
      "modestbranding=1",
      "playsinline=1",
      "enablejsapi=1"
    ]
    params << "autoplay=1" if autoplay
    "https://www.youtube-nocookie.com/embed/#{youtube_video_id}?#{params.join('&')}"
  end

  def official_watch_url
    "https://www.youtube.com/watch?v=#{youtube_video_id}"
  end

  private

  def assign_channel_metadata
    if channel_id.present? && ChannelVerifier.allowed_channel_id?(channel_id)
      info = ChannelVerifier.channel_info(channel_id)
      self.channel_name = info[:name] if channel_name.blank?
      self.channel_url = info[:url] if channel_url.blank?
    elsif channel_name == "Muse India"
      self.channel_id = ChannelVerifier::MUSE_INDIA_CHANNEL_ID
      self.channel_url = "https://www.youtube.com/@MuseIndiaChannel"
    elsif channel_name == "Muse Asia"
      self.channel_id = ChannelVerifier::MUSE_ASIA_CHANNEL_ID
      self.channel_url = "https://www.youtube.com/@MuseAsia"
    end
  end
end
