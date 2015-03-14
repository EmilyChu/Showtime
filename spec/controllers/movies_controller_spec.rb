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
    expect(json.last["title"]).to eq "Movie 3"
  end

  it "can checkout a movie" do
    user = FactoryGirl.create :user
    movie = FactoryGirl.create :movie
    login user

    expect(user.movies.count).to eq 0
    post :checkout, movie_id: movie.id 

    expect(response.code.to_i).to eq 200
  end

  it "can stream a movie" do
    user = FactoryGirl.create :user
    movie = FactoryGirl.create :movie
    login user

    post :stream, movie_id: movie.id 

    expect(response.code.to_i).to eq 200
  end

  it "can checkin a movie" do
    user = FactoryGirl.create :user
    movie = FactoryGirl.create :movie
    login user
    UserMovie.create(user_id: user.id, movie_id: movie.id)

    expect(user.movies).to include movie 
    post :checkin, movie_id: movie.id 

    expect(response.code.to_i).to eq 200
    expect(user.movies).not_to include movie
  end

end