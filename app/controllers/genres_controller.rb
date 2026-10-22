class GenresController < ApplicationController
  def index
    @genres = Genre.all.includes(:animes).order(:name)
  end

  def show
    @genre = Genre.find_by!(slug: params[:id])
    @animes = @genre.animes.verified_catalog.includes(:genres, :episodes).order(popular_rank: :asc, rating: :desc)
  rescue ActiveRecord::RecordNotFound
    redirect_to genres_path, alert: "Genre not found."
  end
end
