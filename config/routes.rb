Rails.application.routes.draw do
  resources :game_genres
  resources :genres
  resources :video_games
  resources :users

  post '/video_games/new', to: 'video_games#index'

  get '/auth/google/callback', to: 'users#google_login'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
