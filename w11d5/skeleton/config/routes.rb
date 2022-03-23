Rails.application.routes.draw do
  # Your routes here!

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    # Your routes here
    resources :guests, only: [:index, :show]

    resources :guests, only: [:index] do
      resources :gifts, only: [:index]
    end

    resources :gifts, only: [:show]

    # resources :gifts, only: [:index, :show]
  end
  # root to: 'static_pages#root'
end
