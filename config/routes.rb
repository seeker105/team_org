Rails.application.routes.draw do

  get 'players/create'

  get 'players/update'

  root 'pages#index'

  get 'auth/facebook', as: :facebook_login
  get 'auth/facebook/callback', to: 'sessions#create', as: :create_session
  get 'users/new'
  get 'users/create'
  get 'coach/dashboard', to: 'coaches#dashboard', as: :coach_dashboard
  get 'create_account', to: 'accounts#create', as: :create_account
  get 'landing', to: 'pages#landing', as: :landing_page
  get 'roster/:id', to: 'teams#index', as: :roster
  post 'teams/create', to: 'teams#create', as: :team_create
  get 'teams/new', to: 'teams#new', as: :team_new
  get 'players/new', to: 'players#new', as: :players_new
  get 'twilio/welcome_messages', to: 'twilio#create', as: :welcome_messages
end
