Rails.application.routes.draw do
  resources :movies, only: [:index, :show]
  resources :users, only: [:index, :show, :create]
  resources :reviews
end
