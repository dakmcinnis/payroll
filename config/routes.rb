Rails.application.routes.draw do
  resources :intervals
  devise_for :users
  resources :pay_periods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: redirect('/pay_periods')
end
