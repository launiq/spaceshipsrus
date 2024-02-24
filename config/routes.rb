Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  resources :spaceships do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:show, :update]
  resources :users, only: [:show]
  get "bookings/:id/accept", to: "bookings#accept", as: :accept_booking
  get "bookings/:id/decline", to: "bookings#decline", as: :decline_booking
end
