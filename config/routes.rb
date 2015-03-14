Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get '/movies' => 'movies#index'
  # get '/queue' => 'movies#checkout'
  post '/movies/:movie_id/checkout' => 'movies#checkout'
  post '/movies/:movie_id/stream' => 'movies#stream'
  post '/movies/:movie_id/checkin' => 'movies#checkin'

  root 'application#home'
end
