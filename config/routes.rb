Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :environments, only: :show
  resources :booked_environments, only: %i(create destroy)
end
