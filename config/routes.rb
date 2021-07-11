Rails.application.routes.draw do
  get 'home/index'
  get 'groups/index'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  root "home#index"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :cakes, only: [:index, :new, :create, :show, :destroy] 
  resources :groups, only: [:index, :new, :create, :show, :destroy]

  get "external", to: "cakes#external", as: "external"
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  post "add_to_group", to: "cakes#add_to_group", as: "add_to_group"
  get "remove_group", to: "cakes#remove_group", as: "remove_group"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
