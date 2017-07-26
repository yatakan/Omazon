Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  resources :carts, only: [:show, :destroy]
  resources :categories, only: [:index, :show]
  resources :orders
  resources :addresses, only: [:index, :new,:create, :edit, :update, :destroy]
  resources :users, only: [:show]
  resources :items, only: [:index, :show] do
    resources :reviews
    collection do
      get 'search'
    end
  end

  post '/add_item/:item_id' => 'carts#add_item'
  post '/update_item/:item_id' => 'carts#update_item'
  delete '/delete_item/:item_id' => 'carts#delete_item'

  post '/review_rate' => 'reviews#review_rate'

end
