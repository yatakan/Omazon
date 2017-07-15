Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :categories,only: [:index]
  resources :items, only: [:index, :show] do
    resources :reviews, only: [:index]
    collection do
      get 'search'
    end
  end
end
