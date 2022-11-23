Rails.application.routes.draw do
  get 'flower/index'
 root "mains#index"
 get "sign_up", to: "registrations#new"
 post "sign_up", to: "registrations#create"
 delete "logout", to: "sessions#destroy"

 get "sign_in", to: "sessions#new"
 post "sign_in", to: "sessions#create"
 
 resources :products
 resources :brands
 resources :variants
 resources :reviews
 resources :mains
end
