Rails.application.routes.draw do
  root 'blogs#index'
  resources :blogs
  resources :favorites, only: [:create, :destroy]
  devise_for :users
  resources :blogs, except: [:index] do
    resource :favorites, only: [:create, :destroy]
  end
end
