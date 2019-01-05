Rails.application.routes.draw do
  root 'welcome#index'

  # User Routes
  get '/register', to: 'users#new', as: 'register'
  post '/register', to: 'users#create', as: 'users'
  get '/dashboard', to: 'users#show', as: 'dashboard'
end
