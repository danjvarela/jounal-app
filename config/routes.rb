Rails.application.routes.draw do
  root "pages#home"
  resources :categories do
    resources :tasks
  end
end
