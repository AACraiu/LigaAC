Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'application#hello_world'

  get 'alta_ruta', to: 'application#alta_ruta'

  get 'users', to: 'users#index'
  get 'users/new', to: 'users#new'
  get 'users/:id', to: 'users#show'
  post 'users', to: 'users#create'
end
