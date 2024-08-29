Rails.application.routes.draw do
  devise_for :users
  root to: "lists#index"

  resources :lists do
    resources :reviews, only: :create
    resources :favoris, only: [:new, :create]
  end

  resources :reviews, only: :destroy
  resources :favoris, only: :destroy

end
