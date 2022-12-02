Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  resources :categories do
    resources :tasks
  end
end
