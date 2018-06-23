Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get 'welcome/about'

  resources :wikis

  resources :charges, only: [:new, :create]

  resources :users, only: [:show, :index]
  root to: 'wikis#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
