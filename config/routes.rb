Rails.application.routes.draw do
  resources :categories, except: [:show] do
    resources :tasks, only: [:new]
  end
  resources :tasks
  devise_for :users
  root "tasks#index"
end
