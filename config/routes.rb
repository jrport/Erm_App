Rails.application.routes.draw do
  devise_for :users, path: 'autenticacao', only: %i[sessions passwords registrations],
                     controllers: {
                       sessions: 'users/sessions',
                       passwords: 'users/passwords',
                       registrations: 'users/registrations'
                     },
                     path_names: { sign_in: 'entrar', sign_out: 'sair', password: 'redefinir_senha' }

  get '/configuracoes', to: 'admin#index', as: 'configuracoes'
  namespace :admin do
    resources :contas, path_names: { new: 'nova', edit: 'editar' } do
      get 'mudar_senha', to: 'contas#edit_password', as: 'edit_password'
      patch 'atualizar_senha', to: 'contas#update_password', 'as': 'update_password'
      get 'mudar_email', to: 'contas#edit_email', 'as': 'edit_email'
      patch 'atualizar_email', to: 'contas#update_email', as: 'update_email'
      delete 'cancelar_cadastro', to: 'contas#destroy', as: 'delete'
    end

    resources :lojas, path_names: { 'new': 'nova' }
  end

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
  root 'pedidos#index', as: :home
end
