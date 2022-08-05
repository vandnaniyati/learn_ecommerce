Rails.application.routes.draw do
 root "mains#index"
 get "sign_up", to: "registrations#new"
 post "sign_up", to: "registrations#create"
 delete "logout", to: "sessions#destroy"
 
 resources :products
 resources :brands
 resources :variants
 resources :reviews
 resources :mains
end
