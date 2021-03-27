Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :prototype, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :prototype do
    resources :comments, only: :create
  end
  resources :users,only: [:show]
end
