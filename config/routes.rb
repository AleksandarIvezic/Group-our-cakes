Rails.application.routes.draw do
  get 'groups/index'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  root "cakes#index"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :cakes, only: [:new, :create, :show, :destroy]
  resources :groups, only: [:index, :new, :create, :show, :destroy]

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
