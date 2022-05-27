Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'application#hello_world'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  # TODO: fix this!
  delete 'logout', to: 'sessions#destroy'
end
