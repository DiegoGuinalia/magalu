Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: proc { [404, {}, ["Not found."]] }

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :favorited_products, only: [:show, :destroy] do
        post :add_to_fav_list, on: :collection
        put :remove_product, on: :collection
      end
    end
  end
end
