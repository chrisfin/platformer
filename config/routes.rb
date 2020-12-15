Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get  'accounts/index', to: 'accounts#index'
  mount StripeEvent::Engine, at: 'webhooks/stripe'

  resources :users
  resources :ratecards
  resources :charges, only: [:new] 
  resources :accounts, only: [:new, :create] 

end
