Rails.application.routes.draw do
  

  
  get 'product/get_time'
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'product#mainpage', as: :authenticated_root
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
    
  end

 

  get 'product/mainpage'
  
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
  
  resources :feedback

  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'

  get '/cart/checkout', to: 'orders#new', as: :checkout
  patch '/cart/checkout', to: 'orders#create'
  get '/cart/list', to: 'orders#list', as: :orderlists
  get '/cart/show_orderitems', to: 'orders#show_orderitems', as: :show_orderitems
  post '/cart/list'
end
