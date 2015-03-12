class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @movies = Movie.all
  end

  def checkout
    current_user.checkout params[:movie]
    @rented = current_user.movies.all
  end

  def stream
  end

end