Rails.application.routes.draw do
  resources :events do 
    resources :registrations
  end
  root to: 'events#index'
  
  resources :users
  get 'signup', to: 'users#new'

  resource :session , only: [:new, :create, :destroy]
end
