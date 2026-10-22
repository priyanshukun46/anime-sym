class AnimesController < ApplicationController
  before_action :set_anime, only: [:show]

  def index
    @genres = Genre.order(:name)
    @selected_genre = Genre.find_by(slug: params[:genre]) if params[:genre].present? && params[:genre] != "all"

    # Base query strictly restricted to anime with verified official Muse Asia / Muse India episodes
    scope = Anime.verified_catalog.includes(:genres, :episodes)

    # Search filter
    scope = scope.search_text(params[:q]) if params[:q].present?

    # Genre filter
    scope = scope.filter_by_genre(params[:genre]) if params[:genre].present?

    # Status filter
    scope = scope.filter_by_status(params[:status]) if params[:status].present?

    # Audio/Language filter
    scope = scope.filter_by_audio(params[:audio]) if params[:audio].present?

    # Sorting
    scope = case params[:sort]
            when "rating"
              scope.order(rating: :desc)
            when "newest"
              scope.order(release_year: :desc, created_at: :desc)
            when "title"
              scope.order(title: :asc)
            when "episodes"
              scope.order(total_episodes: :desc)
            else
              scope.order(popular_rank: :asc, rating: :desc)
            end

    @animes = scope

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @episodes = @anime.episodes.verified_only.order(episode_number: :asc)
    @related_animes = @anime.related_anime(4)
    @first_episode = @episodes.first
  end

  def search_suggestions
    query = params[:q].to_s.strip
    if query.length >= 2
      @results = Anime.verified_catalog.search_text(query).limit(5)
    else
      @results = []
    end

    render layout: false
  end

  private

  def set_anime
    @anime = Anime.find_by(slug: params[:id]) || Anime.find(params[:id])
    unless @anime.episodes.verified_only.exists?
      redirect_to catalog_path, alert: "This anime is not currently available from official verified sources."
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to catalog_path, alert: "Anime not found."
  end
end
