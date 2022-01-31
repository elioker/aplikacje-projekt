

Rails.application.routes.draw do
  root 'home#header'
  resources :categories do
    resources :products
  end
  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  get '/api' => redirect('/swagger/dist/index.html?url=/api-docs.json')
  get '/cart/checkout', to: 'orders#new', as: :checkout
  patch '/cart/checkout', to: 'orders#create'
  resources :users
  
end
