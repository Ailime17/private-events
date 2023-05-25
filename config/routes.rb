Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    resources :events, only: [:new, :create]
  end

  resources :events, except: [:new, :create]

  resources :event_attendings, only: :create
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
end
