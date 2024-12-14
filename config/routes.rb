Rails.application.routes.draw do

  authenticate :user, ->(user) { user.role == 'admin' } do
    mount Motor::Admin => '/motor_admin'
  end


  get 'cart', to: 'cart#show'


  post 'cart/add'
  post 'cart/remove'
  root "home#index"
  resources :home
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'partials/:partial', to: 'partials#show', as: :partial

  resources :news
  resources :club
  resources :team
  resources :opponent
  resources :membership
  resources :product
  resources :advert
  resources :hall_of_fames
  resources :opponent_teams
  resources :statistic
  resources :season
  resources :table

  Rails.application.routes.draw do
    get 'features', to: 'pages#features', as: 'features'
  end
end
