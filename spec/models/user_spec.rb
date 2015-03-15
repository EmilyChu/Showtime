require 'rails_helper'

describe User do
  it "can checkout any movie if not underage" do
    user = FactoryGirl.create :user
    movie = FactoryGirl.create :movie

    expect(user.movies.count).to eq 0
    user.checkout_movie movie

    expect(user.movies.count).to eq 1
    expect(user.movies[0].title).to eq movie.title
  end

  it "cannot checkout a movie if underage" do
    user = FactoryGirl.create :user, age: 16
    movie = FactoryGirl.create :movie, rating: "R"

    expect(user.movies.count).to eq 0
    user.checkout_movie movie

    expect(user.movies.count).to eq 0
    expect(user.movies[0]).to eq nil
  end

  it "cannot checkout a movie if over plan limit" do
    user = FactoryGirl.create :user
    movie1 = FactoryGirl.create :movie
    movie2 = FactoryGirl.create :movie
    movie3 = FactoryGirl.create :movie
    
    expect(user.movies.count).to eq 0
    user.checkout_movie movie1
    user.checkout_movie movie2
    expect(user.movies.count).to eq 2
    
    user.checkout_movie movie3
    expect(user.movies.count).to eq 2
  end

  it "can stream any movie if not underage" do
    user = FactoryGirl.create :user
    movie = FactoryGirl.create :movie

    expect(user.stream_movie movie).to eq true
  end

  it "cannot stream an r-rated movie if underage" do
    user = FactoryGirl.create :user, age: 16
    movie = FactoryGirl.create :movie, rating: "R"

    expect(user.stream_movie movie).to eq false
  end

  it "can checkin a movie" do
    user = FactoryGirl.create :user
    movie = FactoryGirl.create :movie

    expect(user.movies.count).to eq 0
    user.checkout_movie movie
    expect(user.movies.count).to eq 1

    user.checkin_movie movie 
    expect(user.movies.count).to eq 0
  end

end
