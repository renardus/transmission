Rails.application.routes.draw do
  resources :categories do
    resources :sources
  end
  resources :parts
  get 'after_creation/show'

  get 'after_creation/create'

  resources :descriptors
  resources :sources do
    resources :build, controller: 'sources/build'
  end
  root to: 'visitors#index'
  get 'products/:id', to: 'products#show', :as => :products
  devise_for :users
  resources :users
end
