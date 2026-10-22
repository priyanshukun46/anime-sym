class Anime < ApplicationRecord
  has_many :anime_genres, dependent: :destroy
  has_many :genres, through: :anime_genres
  has_many :episodes, -> { where(verified_source: true, channel_id: ChannelVerifier.allowed_channel_ids).order(episode_number: :asc) }, dependent: :destroy
  has_many :collection_animes, dependent: :destroy
  has_many :collections, through: :collection_animes

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :synopsis, presence: true
  validates :poster_url, presence: true
  validates :banner_url, presence: true

  before_validation :generate_slug, on: :create

  scope :verified_catalog, -> { where(id: Episode.verified_only.select(:anime_id)) }
  scope :featured, -> { where(featured: true) }
  scope :trending, -> { where(trending: true).order(popular_rank: :asc) }
  scope :top_rated, -> { order(rating: :desc) }
  scope :latest_releases, -> { order(release_year: :desc, created_at: :desc) }

  scope :search_text, ->(query) {
    if query.present?
      sanitized = "%#{sanitize_sql_like(query.strip)}%"
      where("animes.title ILIKE ? OR animes.japanese_title ILIKE ? OR animes.synopsis ILIKE ? OR animes.studio ILIKE ?", sanitized, sanitized, sanitized, sanitized)
    end
  }

  scope :filter_by_genre, ->(genre_slug) {
    if genre_slug.present? && genre_slug != "all"
      joins(:genres).where(genres: { slug: genre_slug })
    end
  }

  scope :filter_by_status, ->(status) {
    if status.present? && status != "all"
      where(status: status)
    end
  }

  scope :filter_by_audio, ->(audio) {
    case audio
    when "sub"
      where(sub_available: true)
    when "dub"
      where(dub_available: true)
    when "dual"
      where(sub_available: true, dub_available: true)
    end
  }

  def to_param
    slug
  end

  def first_episode
    episodes.first
  end

  def episode_count_display
    count = episodes.count
    if total_episodes.to_i > 0
      "#{count} / #{total_episodes} EP"
    else
      "#{count} EP"
    end
  end

  def formatted_rating
    format("%.1f", rating.to_f)
  end

  def related_anime(limit = 4)
    Anime.verified_catalog
         .joins(:genres)
         .where(genres: { id: genres.pluck(:id) })
         .where.not(id: id)
         .distinct
         .limit(limit)
  end

  private

  def generate_slug
    self.slug = title.to_s.parameterize if slug.blank?
  end
end
