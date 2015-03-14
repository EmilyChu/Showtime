require 'rails_helper'

describe User do
  # it "can checkout a movie" do
  #   user = FactoryGirl.create :user
  #   movie = FactoryGirl.create :movie

  #   expect(user.movies.count).to eq 0
    
  #   user.checkout movie.id

  #   expect(user.movies.count).to eq 1
  #   expect(user.movies[0].title).to eq movie.title
  # end

  # it "can stream a movie only if they checked it out" do
  #   user = FactoryGirl.create :user
  #   movies = 5.times { FactoryGirl.create :movie }
  #   user.checkout  # checkout 3 movies to test..

  #   # user must have movie checked out to stream...
  #   get :stream, movie: movie 

  #   json = response_json
  #   expect(response.code.to_i).to eq 200
  #   expect(json.count).to eq 1
  #   # show movie title...
  # end

end
