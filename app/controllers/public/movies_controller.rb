class Public::MoviesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end
  
  private
  def movie_params
    params.require(:movie).permit(:title, :year, :director, :watch, :overall)
  end
  
end
