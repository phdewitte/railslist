Rails.application.routes.draw do
  resources :categories do
    resources :articles
  end

  resources :users, only: [:new, :create, :show]

  root 'categories#index'
end
