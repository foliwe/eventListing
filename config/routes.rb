Rails.application.routes.draw do
  resources :categories
  resources :events do 
    resources :likes
    resources :registrations
  end
  root to: 'events#index'
  get 'events/filter/:filter', to: 'events#index',as: :filter
  resources :users
  get 'signup', to: 'users#new'

  resource :session , only: [:new, :create, :destroy]
end
