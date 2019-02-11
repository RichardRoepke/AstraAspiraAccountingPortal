Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root to: 'reports#index'

  resources :reports, only: [:index, :show]

  namespace :admin do
    root to: "users#index"

    resources :parks do
      post :recover
    end

    resources :users do
      post :extra_actions
    end
  end
end
