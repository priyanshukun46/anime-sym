class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_watchlist_ids, :in_watchlist?, :watchlist_count, :watched_episode?, :logged_in?, :current_user_email, :current_username

  private

  def current_user_email
    session[:user_email]
  end

  def current_username
    session[:username] || current_user_email&.split("@")&.first
  end

  def logged_in?
    current_user_email.present?
  end

  def current_watchlist_ids
    session[:watchlist] ||= []
  end

  def in_watchlist?(anime)
    return false unless anime
    current_watchlist_ids.include?(anime.id)
  end

  def watchlist_count
    current_watchlist_ids.size
  end

  def watched_episode?(episode)
    return false unless episode
    (session[:watched_episodes] ||= []).include?(episode.id)
  end
end
