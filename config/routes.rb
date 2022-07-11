Rails.application.routes.draw do
 root "products#index"

 resources :products
 resources :brands
 resources :variants
 resources :reviews
end
