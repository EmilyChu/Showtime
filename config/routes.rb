Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get '/movies' => 'movies#index'
  post '/movies/movie_id/queue' => 'movies#checkout'
  get '/movies/movie_id/stream' => 'movies#stream'

  root 'application#home'
end
