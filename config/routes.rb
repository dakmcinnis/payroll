Rails.application.routes.draw do
  resources :intervals
  devise_for :users
  authenticate :user, ->(user) { user.admin? } do
    resources :admin, only: :index do
      collection do
        resources :users
        resources :pay_periods
      end
    end
  end
  resources :pay_periods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: redirect('/intervals')
end
