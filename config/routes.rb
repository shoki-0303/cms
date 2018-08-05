Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :users, only: [:edit, :update]
  resources :drafts, only: [:index, :new, :create, :edit, :update]
end
