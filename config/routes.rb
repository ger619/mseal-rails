Rails.application.routes.draw do
  get 'shop/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
  resources :home
  resources :news
  resources :club
  resources :team
  resources :ticket
  resources :membership
end
