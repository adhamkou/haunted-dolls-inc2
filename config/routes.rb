Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: 'pages#home'
  resources :dolls, only: [:index] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:my_bookings, :set_status]
end
