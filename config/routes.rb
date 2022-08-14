Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[create destroy]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts do
          resources :comments
          post 'authenticate', to: 'authentication#create'
        end
      end
    end
  end
end
