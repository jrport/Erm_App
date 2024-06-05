Rails.application.routes.draw do
  get 'items_de_pedidos/index'
  get 'items_de_pedidos/new'
  get 'items_de_pedidos/show'
  get '/home', to: 'home#index'
  get '/pedidos_chart', to: 'pedidos#chart', as: 'pedidos_chart'
  patch '/bulk_update', to: 'pedidos#bulk_update', as: 'bulk_update', defaults: { format: :turbo_stream }
  resources :pedidos do
    resources :items_de_pedidos, path: 'items', shallow: true
  end
  resources :compras
  resources :items_de_compras, path: 'items', as: 'items'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'home#index'
end
