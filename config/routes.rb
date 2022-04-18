Rails.application.routes.draw do
  root 'pages#home'

  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'
  post 'users', to: 'users#create'

  delete 'logout', to: 'sessions#destroy'

  resources :video_games
  resources :users, except: [:new]
  resources :categories, except: [:destroy]
end
