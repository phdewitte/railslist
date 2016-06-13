Rails.application.routes.draw do
  resources :categories do
    resources :articles
  end

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users, only: [:new, :create, :show]
  resources :sessions

  root 'categories#index'
end
