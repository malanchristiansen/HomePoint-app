Rails.application.routes.draw do
  post 'payment/page', to: "payment#create", as: 'payment'
  get 'payment/cancel', to: "payment#cancel", as: 'payment_cancel'
  get 'home/cities', to: "home#cities", as: 'cities'
  get 'home/nature', to: "home#nature", as: 'nature'
  get 'home/ocean', to: "home#ocean", as: 'ocean'
  get 'home/objects', to: "home#objects", as: 'objects'
  get 'home/other', to: "home#other", as: 'other'
  get 'home/drones', to: "home#drones", as: 'drones'
  resources :reviews
  resources :listings
  resources :profiles
  devise_for :users
  root "home#page"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
