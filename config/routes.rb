Rails.application.routes.draw do
  root 'items#index'
  get 'items/search' => 'items#search'
  resources :categories,only: [:index]
  resources :items, only: [:index] do
    resources :reviews, only: [:index]
  end
end
