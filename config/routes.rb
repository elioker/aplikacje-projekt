Rails.application.routes.draw do
  root 'home#header'
  devise_for :users
  resources :categories do
    resources :products
  end
  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'
  
end
