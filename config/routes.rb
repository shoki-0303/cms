Rails.application.routes.draw do
  root 'articles#index'
  resources :drafts, only: [:index]
end
