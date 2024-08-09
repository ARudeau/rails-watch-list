Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"
  # get 'lists', to: 'lists#index'
  # post 'lists', to: 'lists#create'
  # get 'lists/new', to: 'lists#new', as: :new_list
  # get 'lists/:id', to: 'lists#show', as: :list
  # get "lists/:id/bookmarks/new", as: :new_bookmark
  # post "lists/:id/bookmarks"
  resources :lists, only: %i[index new create show] do
    resources :bookmarks, only: %i[index new create show delete]
  end
  resources :bookmarks, only: %i[destroy]
end
