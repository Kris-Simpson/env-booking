Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'home#index'

  resources :environments, only: :show
  resources :booked_environments, only: %i(create destroy)
end
