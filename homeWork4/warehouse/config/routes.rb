Rails.application.routes.draw do

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  resources :users
  resources :sessions , except: [:edit, :update]
  resources :stores
  resources :categories
  resources :products
  resources :suppliers
  resources :vendors

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'stores#index'
end
