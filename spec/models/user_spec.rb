require 'rails_helper'

describe User do
  it "can checkout a movie" do
    user = FactoryGirl.create :user
    movie = FactoryGirl.create :movie

    expect(user.movies.count).to eq 0
    
    user.checkout movie.id

    expect(user.movies.count).to eq 1
    expect(user.movies[0].title).to eq movie.title
  end
end
