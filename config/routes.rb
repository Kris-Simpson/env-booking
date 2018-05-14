Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'home#index'

  resources :environments, only: :show
  resources :bookings, only: %i(create destroy)
end
