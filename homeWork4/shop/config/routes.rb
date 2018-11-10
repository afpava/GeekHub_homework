Rails.application.routes.draw do
    resources :store
    resources :category
    resources :product

  root 'store#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
