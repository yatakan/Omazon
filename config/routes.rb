Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  resources :carts
  resources :categories,only: [:index, :show]
  resources :orders

  resources :items, only: [:index, :show] do
    resources :reviews
    collection do
      get 'search'
    end
  end


  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'

end
