Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root to: 'parks#index'

  resources :parks, only: [:index, :edit, :update]

  namespace :admin do
    root to: "users#index"

    resources :users, only: [:index, :edit, :update, :show]
  end
end
