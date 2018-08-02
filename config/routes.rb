Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get 'welcome/about'
  # get '/wikis/:wiki_id/collaborators/:id', to: 'collaborators#destroy'
  get 'downgrade', to:  'users#downgrade'

  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end

  resources :charges, only: [:new, :create]

  resources :users, only: [:show, :index]
  root to: 'wikis#index'
end
