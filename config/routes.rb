Rails.application.routes.draw do
  resources :seller_cars
  resources :cars
  resources :sellers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
