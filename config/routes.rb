Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get '/movies' => 'movies#index'
  get '/queue' => 'movies#checkout'
  get '/stream/:movie_id' => 'movies#stream'
  # post '/movies/:movie_id/queue' => 'movies#checkout'


  root 'application#home'
end
