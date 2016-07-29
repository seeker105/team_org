Rails.application.routes.draw do
  root 'pages#index'

  get 'auth/facebook', as: :facebook_login
  get 'auth/facebook/callback', to: 'sessions#create', as: :create_session
  get 'users/new'
  get 'users/create'
  get 'player/dashboard', to: 'players#index', as: :player_dashboard
  get 'coach/dashboard', to: 'coaches#index', as: :coach_dashboard
  get 'create_account', to: 'accounts#create', as: :create_account
  get 'landing', to: 'pages#landing', as: :landing_page


end
