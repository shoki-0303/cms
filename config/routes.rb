Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles, only: [:show]
  resources :users, only: [:edit, :update]
  resources :drafts, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      get :release
    end
  end
  resources :categories, only: [:index, :show, :new, :create, :edit, :update]
  resources :tags, only: [:index, :show, :create, :destroy]
end
