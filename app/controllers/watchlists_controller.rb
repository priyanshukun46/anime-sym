class WatchlistsController < ApplicationController
  def index
    @watchlist_animes = Anime.verified_catalog.where(id: current_watchlist_ids).includes(:genres, :episodes)
  end

  def toggle
    anime_id = params[:anime_id].to_i
    @anime = Anime.verified_catalog.find_by(id: anime_id)

    if @anime
      if current_watchlist_ids.include?(anime_id)
        current_watchlist_ids.delete(anime_id)
        @in_watchlist = false
        @status_message = "Removed from your watchlist"
      else
        current_watchlist_ids << anime_id
        @in_watchlist = true
        @status_message = "Added to your watchlist"
      end

      session[:watchlist] = current_watchlist_ids

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_back fallback_location: root_path, notice: @status_message }
      end
    else
      head :not_found
    end
  end
end
