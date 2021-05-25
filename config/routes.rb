Rails.application.routes.draw do
  root 'welcome#index'

  resources :genres, only: [:index, :show]
  
  resources :video_games do
    resources :genres, except: [:destroy]
  end
  
  resources :users do
    resources :video_games
  end

  post '/video_games/new', to: 'video_games#show'

  #post '/video_games/new'. to: 'video_games#index'

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  get '/index_two', to: 'users#index_two'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
