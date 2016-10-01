Rails.application.routes.draw do
  root 'admin#index'
  get 'admin/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :orders do
    get :autocomplete_customer_shop_name, :on => :collection
    match :delete_order_product, :on => :member, :via => :post
  end
  resources :products
  resources :customers do
    get :autocomplete_city_area, :on => :collection
  end
  resources :vendors do
    get :send_orders, :on => :collection
  end
  resources :cities
end
