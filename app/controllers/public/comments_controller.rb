class Public::CommentsController < ApplicationController

  def create
    movie = Movie.find(params[:movie_id])
    comment = current_user.movies.new(movie_params)
    comment.movie_id = movie.id
    comment.save
    redirect_to public_movie_path(movie)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
