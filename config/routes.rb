Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :home, only: [:index]
  resources :performances, only: [:index]
  resources :bookings, only: [:index, :new, :create]
  resources :galleries, only: [:index]
  resources :abouts, only: [:index]
  resources :contacts, only: [:index, :new, :create]
end
