Rails.application.routes.draw do

  resources :bookings, only: [:new, :create, :show]

  resources :flights, only: :index
  root 'flights#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
