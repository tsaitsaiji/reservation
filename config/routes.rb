Rails.application.routes.draw do
  get 'reservations/new'
  get 'reservations/create'
  get 'reservations/check'
  get 'reservations/observe'
  get 'reservations/destroy'
  resources :reservations, only: [:new, :create]
  get 'reservation/check', to: 'reservations#check'
  get 'reservation/observe', to: 'reservations#observe'
  delete 'reservations/:id', to: 'reservations#destroy', as: 'reservation_destroy'
  root 'reservations#new'

  # Add the success page route
  get 'reservation_success(/:id)', to: 'reservations#success', as: 'reservation_success'

  
  
end