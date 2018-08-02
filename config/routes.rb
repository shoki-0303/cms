Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :drafts, only: [:index]
end
