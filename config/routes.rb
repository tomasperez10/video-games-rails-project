Rails.application.routes.draw do
  root 'welcome#index'

  resources :game_genres

  resources :genres, only: [:index, :show]
  
  resources :video_games do
    resources :genres, except: [:destroy]
  end
  
  resources :users

  post '/video_games/new', to: 'video_games#index'

  get '/auth/google/callback', to: 'users#google_login'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
