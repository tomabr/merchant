Rails.application.routes.draw do
  resources :addresses
  root to: "products#index"

  resources :orders
  resources :order_items
  resources :products

  match '/auth/:provider/callback', to: 'sessions#create', via: :get
  match "/login" => redirect("/auth/twitter"), as: :login, via: :get
  match "/logout" => "sessions#destroy", as: :logout, via: :get

  resources :orders do
    member do
     get :confirm
   end
  end


 
end
