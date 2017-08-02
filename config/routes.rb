Rails.application.routes.draw do
  get 'home', to: 'static#home'
  get 'products/:id/inventory', to: 'products#inventory', as: "product_inventory"
  get 'products/:id/description', to: 'products#description', as: "product_description"
  post 'products/:id/info', to: 'products#info', as: 'product_info'
  resources :orders
  resources :invoices
  resources :products
end
