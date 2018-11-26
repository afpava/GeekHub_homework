Rails.application.routes.draw do

    # get 'signup' => 'users#new'
    # get 'login' => 'sessions#new'
    # get 'logout' => 'sessions#destroy'

    resources :countries do
        resources :cities, only: [:index, :new, :create, :edit, :update, :destroy ]
    end
    resources :cities, only: [:show]

    resources :cities do
      resources :airports, only: [:index, :new, :create, :edit, :update, :destroy ]
    end
    resources :airports, only: [:show]

    resources :airports do
      resources :planes, only: [:index, :new, :create, :edit, :update, :destroy ]
    end
    resources :planes, only: [:show]

    resources :planes do
      resources :passengers, only: [:index, :new, :create, :edit, :update, :destroy ]
    end
    resources :passengers, only: [:show]

    resources :passenger do
      resources :tickets, only: [:index, :new, :create, :edit, :update, :destroy ]
    end
    resources :tickets, only: [:show]

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'countries#index'
end
