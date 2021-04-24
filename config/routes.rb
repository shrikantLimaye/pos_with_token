Rails.application.routes.draw do
  devise_for :users
  root to: 'product#mainpage'
  get 'product/show'
  get 'product/new'
  get 'product/create'
  post 'product/create'
  get 'product/edit'
  get 'product/update'
  patch 'product/update'
  get 'product/delete'
  get 'categories/show'
  post 'categories/show'
  get 'product/page'
  get 'product/list'

  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'

  get '/cart/checkout', to: 'orders#new', as: :checkout
  patch '/cart/checkout', to: 'orders#create'
end
