class EpisodeCommentsController < ApplicationController
  def create
    @anime = Anime.find_by(slug: params[:anime_id]) || Anime.find(params[:anime_id])
    @episode = @anime.episodes.find_by(episode_number: params[:episode_id]) || @anime.episodes.find(params[:episode_id])

    @comment = @episode.episode_comments.build(comment_params)
    @comment.user_name = params[:episode_comment][:user_name].presence || "AnimeSymFan"

    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to anime_episode_path(@anime, @episode), notice: "Reaction posted!" }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("comment_form_errors", partial: "episode_comments/errors", locals: { comment: @comment }) }
        format.html { redirect_to anime_episode_path(@anime, @episode), alert: "Could not post comment." }
      end
    end
  end

  private

  def comment_params
    params.require(:episode_comment).permit(:user_name, :body, :reaction_type)
  end
end
