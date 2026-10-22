class EpisodesController < ApplicationController
  before_action :set_anime

  def show
    @episode = @anime.episodes.verified_only.find_by(episode_number: params[:id]) || @anime.episodes.verified_only.find(params[:id])
    @all_episodes = @anime.episodes.verified_only.order(episode_number: :asc)
    @next_episode = @episode.next_episode
    @previous_episode = @episode.previous_episode
    @comments = @episode.episode_comments.order(created_at: :desc)
    @new_comment = EpisodeComment.new

    # Optionally mark episode as watched
    if params[:mark_watched] == "true"
      session[:watched_episodes] ||= []
      session[:watched_episodes] << @episode.id unless session[:watched_episodes].include?(@episode.id)
    elsif params[:mark_watched] == "false"
      session[:watched_episodes]&.delete(@episode.id)
    end

    # Increment view counter gently
    @episode.increment!(:views_count)
    @anime.increment!(:views_count)
  rescue ActiveRecord::RecordNotFound
    redirect_to anime_path(@anime), alert: "Verified episode not found."
  end

  private

  def set_anime
    @anime = Anime.find_by(slug: params[:anime_id]) || Anime.find(params[:anime_id])
    unless @anime.episodes.verified_only.exists?
      redirect_to catalog_path, alert: "This series does not have verified official episodes available."
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to catalog_path, alert: "Anime not found."
  end
end
