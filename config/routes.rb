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

  # City Routes
  get '/city', to: 'city#show'

  # API Routes

  namespace :api do
    namespace :v0 do
      post '/favorites', to: 'favorites#create'
      delete '/favorites', to: 'favorites#destroy'
    end
  end
end
