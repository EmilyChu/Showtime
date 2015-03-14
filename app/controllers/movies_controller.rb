class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @movies = Movie.all
  end

  def checkout
    m = Movie.where(id: params[:movie_id]).first!
    if current_user.checkout_movie m 
      head :ok
    else
    end
  end

  def stream
    m = Movie.where(id: params[:movie_id]).first!
    if current_user.stream_movie m
      head :ok
    else
    end
  end

  def checkin
    m = Movie.where(id: params[:movie_id]).first!
    if current_user.checkin_movie m
      head :ok
    else
    end
  end

end