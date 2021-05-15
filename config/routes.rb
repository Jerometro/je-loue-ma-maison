Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :houses do
    resources :rentals, only: [:create]
  end

  resources :rentals, only: [] do
    member { patch :accept }
    member { patch :deny }
    member { patch :cancel }
  end

  resource :dashboard, only: [:show]

end
