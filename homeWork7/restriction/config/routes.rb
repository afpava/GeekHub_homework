Rails.application.routes.draw do

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions , except: [:edit, :update]
  resources :users do
      resources :posts
  end

root 'users#index'
end
