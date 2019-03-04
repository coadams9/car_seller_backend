Rails.application.routes.draw do
  # resources :seller_cars
  # resources :cars
  # resources :sellers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :api do
        namespace :v1 do
            resources :cars, only: [:index, :show]
            resources :sellers, only: [:index, :show]
            # root '/'
        end
    end
end
