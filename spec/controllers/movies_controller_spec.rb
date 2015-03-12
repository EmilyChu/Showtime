require 'rails_helper'

describe MoviesController do
  render_views

  it "can list all movies" do
    movies = 3.times { FactoryGirl.create :movie }
    get :index
    expect(response.code.to_i).to eq 200

    json = response_json
    expect(json.class).to eq Array
    expect(json.count).to eq 3
  end

  it "can checkout a movie" do
    user = FactoryGirl.create :user
    movie = FactoryGirl.create :movie
    login user

    expect(user.movies.count).to eq 0
    get :checkout, movie: movie 

    json = response_json
    expect(json.class).to eq Array
    expect(json.count).to eq 1
    expect(user.movies.count).to eq 1
    expect(user.movies[0].title).to eq movie.title
  end

  # fit "can stream a movie" do
  #   user = FactoryGirl.create :user
  #   movie = FactoryGirl.create :movie
  #   login user

  #   get :stream, movie: movie 

  #   json = response_json
  #   expect(response.code.to_i).to eq 200
    # show movie title...

  # end

  # it "will only stream if user is old enough" do
  # end

  # it "won't let you to checkout a movie if over limit" do
  # end


end