require 'rails_helper'

describe MoviesController do
  render_views

  it "can list all the movies" do
    movies = FactoryGirl.create :movie 
    get :index
    expect(response.code.to_i).to eq 200

    json = response_json
    expect(json.class).to eq Array
    expect(json.count).to eq 1


  end

  it "can checkout a movie" do 
  end

  it "can stream a movie" do
  end

  it "will only stream if user is old enough" do
  end

  it "won't let you to checkout a movie if over limit" do
  end


end