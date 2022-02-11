Rails.application.routes.draw do
  devise_for :users
  get '/latest_timesheet', to: 'timesheets#show_latest'
  resources :timesheets do
    resources :intervals
  end
  authenticate :user, ->(user) { user.admin? } do
    resources :admin, only: :index do
      collection do
        resources :users
        resources :pay_periods
        # TODO: Add timesheets and intervals beneath payperiods
        # Admins should be able to view & edit all timesheets
      end
    end
  end
  # Defines the root path route ("/")
  root to: redirect('/latest_timesheet')
end
