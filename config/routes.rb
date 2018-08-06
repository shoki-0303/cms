Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles, only: [:show]
  resources :users, only: [:edit, :update]
  resources :drafts, only: [:index, :new, :create, :edit, :update] do
    member do
      get :release
    end
  end
  resources :categories, only: [:index]
end
