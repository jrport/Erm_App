Rails.application.routes.draw do
  # get 'home/index'


  resources :pedidos, path_names: { new: 'novo', create: 'criar' } do
    collection do
      get 'chart'
      patch 'bulk_update'
    end
    resources :items_de_pedidos, only: %i[new create destroy], path_names: { new: 'novo', create: 'criar' }
  end

  resources :inventarios, except: %w[edit new] do
    collection do
      patch :bulk_update
    end
  end

  resources :compras, path_names: { edit: 'editar', new: 'novo', create: 'criar' } do
    collection do
      get :chart_qtd
      get :chart_cost
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root 'home#index', as: :home
  root 'home#index', as: :home
end
