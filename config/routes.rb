Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :categories, except: [:show]
  resources :clients, except: [:show]
  resources :suppliers, except: [:show]
  resources :products, except: [:show]
  resources :sales
  get 'buscador_productos/:termino', to: 'products#buscador'
  post 'add_item_venta', to: 'sales#add_item'
  get 'buscador_clientes/:termino', to: 'clients#buscador'
  post '/add_cliente_venta/', to: 'sales#add_cliente'
end
