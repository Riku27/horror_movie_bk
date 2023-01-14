class Public::MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id

    if @movie.save
      redirect_to '/public/my_page'
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to '/public/my_page'
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to '/public'
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :year, :director, :watch, :rate, :genre_id)
  end

end
