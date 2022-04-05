Rails.application.routes.draw do
  root 'pages#home'

  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'

  resources :video_games
  resources :users, except: [:new]
end
