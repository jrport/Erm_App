Rails.application.routes.draw do
  root 'pedidos#index', as: :home
  devise_for :users, path: 'autenticacao', only: %i[sessions passwords registrations],
                     controllers: {
                       sessions: 'users/sessions',
                       passwords: 'users/passwords',
                       registrations: 'users/registrations'
                     },
                     path_names: { sign_in: 'entrar', sign_out: 'sair', password: 'redefinir_senha' }

  get '/configuracoes', to: 'admin#index', as: 'configuracoes'

  resources :lojistas, controller: :lojista, except: %w[destroy],
                       path_names: { new: 'nova', edit: 'editar', index: 'dashboard' }

  namespace :admin do
    resources :contas, path_names: { new: 'nova', edit: 'editar' } do
      get 'mudar_senha', to: 'contas#edit_password', as: 'edit_password'
      patch 'atualizar_senha', to: 'contas#update_password', 'as': 'update_password'
      get 'mudar_email', to: 'contas#edit_email', 'as': 'edit_email'
      patch 'atualizar_email', to: 'contas#update_email', as: 'update_email'
      delete 'cancelar_cadastro', to: 'contas#destroy', as: 'delete'
    end

    resources :lojas,
              path_names: { 'new': 'nova', 'edit': 'editar', 'patch': 'atualizar', delete: 'deletar',
                            'create': 'criar' }
  end

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

  # namespace :lojista do
  # get 'pedidos/index'
  # get 'pedidos/show'
  # get 'pedidos/edit'
  # get 'pedidos/update'
  # get 'pedidos/create'
  # resources :pedidos, except: %w[destroy], path_names: { new: 'nova', edit: 'editar' }
  # end
  # get '/' => redirect('/lojista/menu')
  # get 'menu', to: 'lojista#index'

  # Defines the root path route ("/")
  # root 'home#index', as: :home

  get 'up' => 'rails/health#show', as: :rails_health_check
end
