Rails.application.routes.draw do
  get 'teams/:team_slug/edit', to: 'teams#edit', as: :team_edit
  post 'teams/:team_slug/update', to: 'teams#update', as: :team_update

  root 'pages#index'

  get 'auth/facebook', as: :facebook_login
  get 'auth/facebook/callback', to: 'sessions#create', as: :create_session
  get 'coach/dashboard', to: 'coaches#dashboard', as: :coach_dashboard
  get 'roster/:team_slug', to: 'teams#index', as: :roster

  post 'teams/create', to: 'teams#create', as: :team_create
  get 'teams/new', to: 'teams#new', as: :team_new

  get 'players/new/:team_slug', to: 'players#new', as: :players_new
  get 'players/create/:team_slug', to: 'players#create', as: :players_create

  get 'twilio/welcome_messages', to: 'twilio#create', as: :welcome_messages

end
