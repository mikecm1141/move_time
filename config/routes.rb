Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: %i[new]
end
