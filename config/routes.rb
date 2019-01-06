Rails.application.routes.draw do
  root 'welcome#index'

  # Session Routes
  get '/login',     to: 'sessions#new',     as: 'login'
  post '/login',    to: 'sessions#create',  as: 'new_login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # User Routes
  get '/register',  to: 'users#new',    as: 'register'
  post '/register', to: 'users#create', as: 'users'
  get '/dashboard', to: 'users#show',   as: 'dashboard'

  # Search Routes
  get '/search', to: 'search#index'
end
