class HomeController < ApplicationController
  def index
    @hero_anime = Anime.verified_catalog.featured.order(rating: :desc).first || Anime.verified_catalog.first
    @hero_slides = Anime.verified_catalog.featured.order(rating: :desc).limit(4)
    @trending_anime = Anime.verified_catalog.trending.includes(:genres, :episodes).limit(8)
    @top_rated_anime = Anime.verified_catalog.top_rated.includes(:genres, :episodes).limit(8)
    @featured_collections = Collection.featured.includes(animes: [:genres, :episodes]).limit(4)
    @genres = Genre.order(:name)
    @latest_episodes = Episode.verified_only.includes(:anime).order(aired_at: :desc, created_at: :desc).limit(6)
  end
end
