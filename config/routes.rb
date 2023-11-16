Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # config/routes.rb
  namespace :api, defaults: { format: 'json' } do
    resources :sessions, only: [:create, :destroy]
  
    resources :users do
      resource :wallet, only: [:show, :update] do
        resources :transactions, only: [:index, :create]
      end
    end
  
    resources :teams do
      resources :wallet, only: [:show, :update] do
        resources :transactions, only: [:index, :create]
      end
    end
  
    resources :stocks do
      resources :wallet, only: [:show, :update] do
        resources :transactions, only: [:index, :create]
      end
    end
  
    get '/latest_stock_price/:symbol', to: 'latest_stock_price#price'
    post '/latest_stock_price/prices', to: 'latest_stock_price#prices'
    get '/latest_stock_price/price_all', to: 'latest_stock_price#price_all'
  end

end
