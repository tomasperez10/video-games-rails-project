Rails.application.routes.draw do
  resources :game_genres
  resources :genres
  resources :video_games
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
