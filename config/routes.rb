Rails.application.routes.draw do
  resources :pay_periods
  resources :intervals
  devise_for :users
  match '/users', to: 'users#index', via: 'get'
  match '/users/:id', to: 'users#show', via: 'get'
  resources :users, :only =>[:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: redirect('/pay_periods')
end
