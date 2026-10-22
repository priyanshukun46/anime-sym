class CollectionsController < ApplicationController
  def index
    @collections = Collection.includes(animes: [:genres, :episodes]).order(position: :asc)
  end

  def show
    @collection = Collection.find_by!(slug: params[:id])
    @animes = @collection.animes.verified_catalog.includes(:genres, :episodes)
  rescue ActiveRecord::RecordNotFound
    redirect_to collections_path, alert: "Collection not found."
  end
end
