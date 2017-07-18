Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get 'carts/index' => 'carts#index'
  resources :categories,only: [:index]
  resources :items, only: [:index, :show] do
    resources :reviews
    resources :carts, only: [:create]
    collection do
      get 'search'
    end
  end
  resources :orders
end
