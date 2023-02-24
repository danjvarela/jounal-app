Rails.application.routes.draw do
  resources :categories, except: [:show] do
    resources :tasks, only: [:new]
  end
  resources :tasks
  put "/tasks/:id/complete", to: "tasks#complete", as: "complete_task"
  devise_for :users
  root "tasks#index"
end
